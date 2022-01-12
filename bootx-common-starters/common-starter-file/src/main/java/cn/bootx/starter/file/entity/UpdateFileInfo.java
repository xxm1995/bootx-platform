package cn.bootx.starter.file.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.starter.file.FileConvert;
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
@TableName("starter_upload_file")
public class UpdateFileInfo extends MpIdEntity implements EntityBaseFunction<UpdateFileDto> {

    /** 文件唯一标识 */
    private String fileId;

    /** 存储位置 */
    private Integer location;

    /** 文件名称 */
    private Integer fileName;

    /** 文件后缀 */
    private Integer fileSuffix;

    /** 文件大小 */
    private Integer fileSize;

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
