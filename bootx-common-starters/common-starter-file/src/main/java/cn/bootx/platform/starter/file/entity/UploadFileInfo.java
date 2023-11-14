package cn.bootx.platform.starter.file.entity;

import cn.bootx.platform.starter.file.convert.FileConvert;
import cn.bootx.platform.common.core.function.EntityBaseFunction;
import cn.bootx.platform.common.mybatisplus.base.MpIdEntity;
import cn.bootx.platform.starter.file.dto.UploadFileDto;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.dromara.x.file.storage.core.FileInfo;

import java.time.LocalDateTime;

/**
 * 上传文件信息
 *
 * @author xxm
 * @since 2022/1/12
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName(value = "starter_file_upload_info",autoResultMap = true)
public class UploadFileInfo extends MpIdEntity implements EntityBaseFunction<UploadFileDto> {

    /** 存储位置 */
    private String filePath;

    /** 文件名称 */
    private String fileName;

    /** 文件类型 */
    private String fileType;

    /** 文件后缀 */
    private String fileSuffix;

    /** 文件大小 */
    private Long fileSize;

    /** 外部存储id */
    private String externalStorageId;

    /** 创建者ID */
    @TableField(fill = FieldFill.INSERT)
    private Long creator;

    /** 创建时间 */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @Override
    public UploadFileDto toDto() {
        return FileConvert.CONVERT.convert(this);
    }

    /**
     * 初始化创建
     */
    public static UploadFileInfo init(FileInfo fileInfo){
        return FileConvert.CONVERT.convert(fileInfo);
    }

    /**
     * 转换为 x.file.storage 的文件信息对象
     */
    public FileInfo toFileInfo(){
        return FileConvert.CONVERT.toFileInfo(this);
    }

}
