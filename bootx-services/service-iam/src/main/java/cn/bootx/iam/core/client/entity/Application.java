package cn.bootx.iam.core.client.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.iam.core.client.convert.ApplicationConvert;
import cn.bootx.iam.dto.client.ApplicationDto;
import cn.bootx.iam.param.client.ApplicationParam;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 认证应用
 * @author xxm
 * @date 2022-06-27
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("iam_application")
@Accessors(chain = true)
public class Application extends MpBaseEntity implements EntityBaseFunction<ApplicationDto>{

    /** 编码 */
    private String code;
    /** 名称 */
    private String name;
    /** 是否系统内置 */
    @TableField("`system`")
    private boolean system;
    /** 是否可用 */
    private boolean enable;
    /** 关联终端 */
    private String clientIds;
    /** 描述 */
    private String description;

    /** 创建对象 */
    public static Application init(ApplicationParam in) {
        Application application = ApplicationConvert.CONVERT.convert(in);
        if (CollUtil.isNotEmpty(in.getClientIdList())){
            String clientIds= String.join(",", in.getClientIdList());
            application.setClientIds(clientIds);
        }
        return application;
    }

    /** 转换成dto */
    @Override
    public ApplicationDto toDto() {
        ApplicationDto application = ApplicationConvert.CONVERT.convert(this);
        if (StrUtil.isNotBlank(this.getClientIds())){
            List<String> collect = Arrays.stream(this.getClientIds().split(","))
                    .collect(Collectors.toList());
            application.setClientIdList(collect);
        }
        return application;
    }
}
