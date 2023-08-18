package cn.bootx.platform.starter.file.service.impl;

import cn.bootx.platform.common.jackson.util.JacksonUtil;
import cn.bootx.platform.starter.file.code.FileUploadTypeEnum;
import cn.bootx.platform.starter.file.configuration.FileUploadProperties;
import cn.bootx.platform.starter.file.dto.TempCredential;
import cn.bootx.platform.starter.file.entity.UpdateFileInfo;
import cn.bootx.platform.starter.file.entity.UploadFileContext;
import cn.bootx.platform.starter.file.service.UploadService;
import cn.hutool.core.codec.Base64Encoder;
import cn.hutool.core.date.LocalDateTimeUtil;
import cn.hutool.core.date.SystemClock;
import cn.hutool.crypto.SecureUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.node.POJONode;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.http.HttpProtocol;
import com.qcloud.cos.region.Region;
import com.tencent.cloud.CosStsClient;
import com.tencent.cloud.Response;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.joda.time.DateTime;
import org.joda.time.DateTimeUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoField;
import java.time.temporal.ChronoUnit;
import java.util.Base64;
import java.util.Objects;
import java.util.TreeMap;

import static java.time.temporal.ChronoUnit.MINUTES;

/**
 * 阿里云OSS上传文件
 *
 * @author xxm
 * @since 2022/1/12
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class TencentOssUploadService implements UploadService {
    private final FileUploadProperties fileUploadProperties;

    private final ObjectMapper objectMapper;

    COSClient client;

    @Override
    public boolean enable(FileUploadTypeEnum type) {
        boolean initFlag = type == FileUploadTypeEnum.TENCENT_OSS;
        if (initFlag) {
            this.doInit();
        }
        return initFlag;
    }

    @Override
    public UpdateFileInfo upload(MultipartFile file, UploadFileContext context) {
        return null;
    }

    @Override
    public void preview(UpdateFileInfo updateFileInfo, HttpServletResponse response) {

    }

    @Override
    public InputStream download(UpdateFileInfo updateFileInfo) {
        return null;
    }

    @Override
    public void delete(UpdateFileInfo updateFileInfo) {

    }

    public TempCredential getTemplateCredential() {
        TempCredential tempCredential;
        FileUploadProperties.TencentOss oss = fileUploadProperties.getTencentOss();

        TreeMap<String, Object> config = new TreeMap<String, Object>();
        config.put("secretId", oss.getSecretId());
        config.put("secretKey", oss.getSecretKey());
        config.put("durationSeconds", 1800);
        config.put("bucket", oss.getBucket());
        config.put("region", oss.getRegion());
        config.put("allowPrefixes", new String[]{
                "bootx/*"
        });

        String[] allowActions = new String[]{
                // 简单上传
                "name/cos:PutObject",
                // 表单上传、小程序上传
                "name/cos:PostObject",
                // 分块上传
                "name/cos:InitiateMultipartUpload",
                "name/cos:ListMultipartUploads",
                "name/cos:ListParts",
                "name/cos:UploadPart",
                "name/cos:CompleteMultipartUpload"
        };
        config.put("allowActions", allowActions);
        try {
            Response response = CosStsClient.getCredential(config);
            tempCredential = new TempCredential();
            tempCredential.setSessionToken(response.credentials.sessionToken);
            tempCredential.setTmpSecretKey(response.credentials.tmpSecretKey);
            tempCredential.setTmpSecretId(response.credentials.tmpSecretId);
            tempCredential.setExpiredTime(1800L);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        LocalDateTime startTime = LocalDateTime.now();

        LocalDateTime endTime = startTime.plus(5, MINUTES);
        String keyTime = LocalDateTimeUtil.toEpochMilli(startTime) / 1000 + ":" + LocalDateTimeUtil.toEpochMilli(endTime) / 1000;
        TreeMap<String, String> formData = new TreeMap<>();
        ObjectNode root = objectMapper.createObjectNode();

        root.put("expiration", endTime.plus(30, MINUTES).atZone(ZoneId.systemDefault())
                .withZoneSameInstant(ZoneId.of("Z")).withNano(0).toString());
       // root.put("expiration", endTime.plus(30, MINUTES).withNano(0).format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
        ArrayNode conditions = objectMapper.createArrayNode();
        root.putIfAbsent("conditions", conditions);
        ObjectNode child = objectMapper.createObjectNode();
        child.put("bucket", oss.getBucket());
        conditions.addPOJO(child);
        child = objectMapper.createObjectNode();
        child.put("q-sign-algorithm", "sha1");
        conditions.addPOJO(child);
        child = objectMapper.createObjectNode();
        child.put("q-ak", tempCredential.getTmpSecretId());

        conditions.addPOJO(child);
        child = objectMapper.createObjectNode();
        child.put("q-sign-time", keyTime);
        conditions.addPOJO(child);
        formData.put("x-cos-security-token", tempCredential.getSessionToken());

        formData.put("policy", Base64Encoder.encode(JacksonUtil.toJson(root)));
        formData.put("q-sign-algorithm", "sha1");

        formData.put("q-ak", tempCredential.getTmpSecretId());

        formData.put("q-key-time", keyTime);

        String signKey = SecureUtil.hmacSha1(tempCredential.getTmpSecretKey()).digestHex(keyTime);
        String stringToSign = SecureUtil.sha1(signKey);
        String signature = SecureUtil.hmacSha1(signKey).digestHex(stringToSign);
        formData.put("q-signature", signature);

        tempCredential.setFormData(formData);
        tempCredential.setUploadUrl("https://" + oss.getBucket() + ".cos.ap-beijing.myqcloud.com");
        return tempCredential;
    }

    protected void doInit() {
        if (Objects.nonNull(client)) {
            return;
        }
        // 初始化客户端
        FileUploadProperties.TencentOss oss = fileUploadProperties.getTencentOss();

        Region region = new Region(oss.getRegion()); //COS_REGION 参数：配置成存储桶 bucket 的实际地域，例如 ap-beijing，更多 COS 地域的简称请参见 https://cloud.tencent.com/document/product/436/6224
        ClientConfig clientConfig = new ClientConfig(region);
        clientConfig.setHttpProtocol(HttpProtocol.https);
        COSCredentials cred = new BasicCOSCredentials(oss.getSecretId(), oss.getSecretKey());
        client = new COSClient(cred, clientConfig);
    }
}
