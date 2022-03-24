package cn.bootx.demo.core.encrypt.entity;

import cn.bootx.common.core.annotation.EncryptionField;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.FieldStrategy;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 权限显示demo
 * @author xxm
 * @date 2022/2/21
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "数据加密解密")
@TableName("demo_data_encrypt")
public class DataEncryptDemo extends MpBaseEntity {

    @Schema(description = "标题")
    private String name;

    @Schema(description = "要加密的内容")
    @EncryptionField
    private String content;

    @Schema(description = "加密后的内容")
    @TableField(value = "content",updateStrategy = FieldStrategy.NEVER,insertStrategy = FieldStrategy.NEVER)
    private String contentEncryption;
}
