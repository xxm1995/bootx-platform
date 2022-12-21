package cn.bootx.demo.core.perm.entity;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 权限显示demo
 *
 * @author xxm
 * @date 2022/2/21
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "权限显示demo")
@TableName("demo_data_perm")
public class DataPermDemo extends MpBaseEntity {

    @Schema(description = "名称")
    private String name;

    @Schema(description = "创建人名称")
    private String creatorName;

    @Schema(description = "备注")
    private String remark;

}
