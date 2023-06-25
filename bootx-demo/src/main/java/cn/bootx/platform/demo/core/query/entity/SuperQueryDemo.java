package cn.bootx.platform.demo.core.query.entity;

import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

/**
 * 超级查询演示
 *
 * @author xxm
 * @since 2022/2/21
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("demo_super_query")
@Schema(title = "超级查询演示")
public class SuperQueryDemo extends MpBaseEntity {

    @Schema(description = "姓名")
    private String name;

    @Schema(description = "年龄")
    private Integer age;

    @Schema(description = "是否vip会员")
    private Boolean vip;

    @Schema(description = "生日")
    private LocalDate birthday;

    @Schema(description = "工作时间")
    private LocalTime workTime;

    @Schema(description = "注册时间")
    private LocalDateTime registrationTime;

    @Schema(description = "政治面貌")
    private Integer political;

    @Schema(description = "备注")
    private String remark;

}
