package cn.bootx.starter.file.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.starter.file.convert.FileConvert;
import cn.bootx.starter.file.dto.UpdateFileDto;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**   
* 上传文件信息
* @author xxm  
* @date 2022/1/12 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("starter_file_upload_info")
public class UpdateFileInfo extends MpIdEntity implements EntityBaseFunction<UpdateFileDto> {

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
    public UpdateFileDto toDto() {
        return FileConvert.CONVERT.convert(this);
    }
}
