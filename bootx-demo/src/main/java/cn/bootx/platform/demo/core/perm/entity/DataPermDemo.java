package cn.bootx.platform.demo.core.perm.entity;

import cn.bootx.platform.common.core.annotation.DataVersionLog;
import cn.bootx.platform.common.core.annotation.PermCode;
import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 权限显示demo
 *
 * @author xxm
 * @since 2022/2/21
 */
@DataVersionLog(title = "数据权限演示")
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "权限显示demo")
@TableName("demo_data_perm")
public class DataPermDemo extends MpBaseEntity {

    @Schema(description = "名称")
    private String name;

    @PermCode("123")
    @Schema(description = "创建人名称")
    private String creatorName;

    @Schema(description = "备注")
    private String remark;

}
