package cn.bootx.platform.starter.file.service.impl;

import cn.bootx.platform.common.core.exception.BizException;
import cn.bootx.platform.common.jackson.util.JacksonUtil;
import cn.bootx.platform.starter.file.code.FileUploadTypeEnum;
import cn.bootx.platform.starter.file.configuration.FileUploadProperties;
import cn.bootx.platform.starter.file.dto.UpLoadOptions;
import cn.bootx.platform.starter.file.entity.UpdateFileInfo;
import cn.bootx.platform.starter.file.entity.UploadFileContext;
import cn.bootx.platform.starter.file.service.UploadService;
import cn.hutool.core.codec.Base64Encoder;
import cn.hutool.core.date.LocalDateTimeUtil;
import cn.hutool.crypto.SecureUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.exception.CosClientException;
import com.qcloud.cos.http.HttpMethodName;
import com.qcloud.cos.http.HttpProtocol;
import com.qcloud.cos.model.GeneratePresignedUrlRequest;
import com.qcloud.cos.model.ObjectMetadata;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.UploadResult;
import com.qcloud.cos.region.Region;
import com.qcloud.cos.transfer.TransferManager;
import com.qcloud.cos.transfer.TransferManagerConfiguration;
import com.qcloud.cos.transfer.Upload;
import com.tencent.cloud.CosStsClient;
import com.tencent.cloud.Response;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.Objects;
import java.util.TreeMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

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
    TransferManager transferManager;

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
        FileUploadProperties.TencentOss oss = fileUploadProperties.getTencentOss();
        ObjectMetadata objectMetadata = new ObjectMetadata();
        objectMetadata.setContentLength(file.getSize());
        PutObjectRequest putObjectRequest;
        UploadResult uploadResult;
        try {
            putObjectRequest = new PutObjectRequest(oss.getBucket(), context.getFileId().toString(), file.getInputStream(), objectMetadata);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        try {
            // 高级接口会返回一个异步结果Upload
            // 可同步地调用 waitForUploadResult 方法等待上传完成，成功返回 UploadResult, 失败抛出异常
            Upload upload = transferManager.upload(putObjectRequest);
            uploadResult = upload.waitForUploadResult();
        } catch (CosClientException | InterruptedException e) {
            e.printStackTrace();
            log.error("上传失败，原因:", e);
            throw new BizException("上传失败");
        }

        return new UpdateFileInfo().setExternalStorageId(uploadResult.getKey()).setFileSize(file.getSize());
    }

    @Override
    public void preview(UpdateFileInfo updateFileInfo, HttpServletResponse response) {
        FileUploadProperties.TencentOss oss = fileUploadProperties.getTencentOss();
        String key = updateFileInfo.getExternalStorageId();
        GeneratePresignedUrlRequest req =
                new GeneratePresignedUrlRequest(oss.getBucket(), key, HttpMethodName.GET);
        Date expirationDate = new Date(System.currentTimeMillis() + 30L * 60L * 1000L);
        req.setExpiration(expirationDate);
        URL url = client.generatePresignedUrl(req);
        try {
            response.sendRedirect(url.toString());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public InputStream download(UpdateFileInfo updateFileInfo) {
        FileUploadProperties.TencentOss oss = fileUploadProperties.getTencentOss();
        String key = updateFileInfo.getExternalStorageId();
        GeneratePresignedUrlRequest req =
                new GeneratePresignedUrlRequest(oss.getBucket(), key, HttpMethodName.GET);
        Date expirationDate = new Date(System.currentTimeMillis() + 30L * 60L * 1000L);
        req.setExpiration(expirationDate);
        URL url = client.generatePresignedUrl(req);
        try {
            return url.openStream();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(UpdateFileInfo updateFileInfo) {
        FileUploadProperties.TencentOss oss = fileUploadProperties.getTencentOss();
        client.deleteObject(oss.getBucket(), updateFileInfo.getFileName());
    }

    public UpLoadOptions getTemplateCredential() {
        UpLoadOptions options;
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
            options = new UpLoadOptions();
            options.setSessionToken(response.credentials.sessionToken);
            options.setTmpSecretKey(response.credentials.tmpSecretKey);
            options.setTmpSecretId(response.credentials.tmpSecretId);
            options.setExpiredTime(1800L);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        LocalDateTime startTime = LocalDateTime.now();
        LocalDateTime endTime = startTime.plus(5, MINUTES);
        String keyTime = LocalDateTimeUtil.toEpochMilli(startTime) / 1000 + ";" + LocalDateTimeUtil.toEpochMilli(endTime) / 1000;
        TreeMap<String, String> formData = new TreeMap<>();
        ObjectNode root = objectMapper.createObjectNode();
        root.put("expiration", endTime.plus(30, MINUTES).withNano(0).atZone(ZoneId.of("Z"))
                .toString());
        ArrayNode conditions = objectMapper.createArrayNode();
        root.putIfAbsent("conditions", conditions);
        ObjectNode child = objectMapper.createObjectNode();
        child.put("acl", "default");
        child = objectMapper.createObjectNode();
        child.put("bucket", oss.getBucket());
        ArrayNode tempArr = objectMapper.createArrayNode();
        tempArr.add("starts-with");
        tempArr.add("$key");
        tempArr.add("bootx/");
        conditions.addPOJO(tempArr);
        conditions.addPOJO(child);
        child = objectMapper.createObjectNode();
        child.put("q-sign-algorithm", "sha1");
        conditions.addPOJO(child);
        child = objectMapper.createObjectNode();
        child.put("q-ak", options.getTmpSecretId());

        conditions.addPOJO(child);
        child = objectMapper.createObjectNode();
        child.put("q-sign-time", keyTime);
        conditions.addPOJO(child);
        formData.put("x-cos-security-token", options.getSessionToken());
        String policyText = JacksonUtil.toJson(root);
        formData.put("policy", Base64Encoder.encode(policyText));
        formData.put("acl", "default");
        formData.put("q-sign-algorithm", "sha1");
        formData.put("q-ak", options.getTmpSecretId());
        formData.put("q-key-time", keyTime);
        String signKey = SecureUtil.hmacSha1(options.getTmpSecretKey()).digestHex(keyTime);
        String stringToSign = SecureUtil.sha1().digestHex(policyText);
        String signature = SecureUtil.hmacSha1(signKey).digestHex(stringToSign);
        formData.put("q-signature", signature);
        log.info("signKey:{},stringToSign:{},signature:{}", signKey, stringToSign, signature);
        options.setFormData(formData);
        options.setUploadUrl("https://" + oss.getBucket() + ".cos.ap-beijing.myqcloud.com");
        
        
        return options;
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
        ExecutorService threadPool = Executors.newFixedThreadPool(32);
        transferManager = new TransferManager(client, threadPool);
        TransferManagerConfiguration transferManagerConfiguration = new TransferManagerConfiguration();
        transferManagerConfiguration.setMultipartUploadThreshold(5 * 1024 * 1024);
        transferManagerConfiguration.setMinimumUploadPartSize(1024 * 1024);
        transferManager.setConfiguration(transferManagerConfiguration);

    }
}
