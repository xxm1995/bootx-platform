package cn.bootx.iam.core.client.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.iam.core.client.convert.ClientConvert;
import cn.bootx.iam.dto.client.ClientDto;
import cn.bootx.iam.param.client.ClientParam;
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
* 认证终端
* @author xxm
* @date 2021/8/25
*/
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("iam_client")
@Accessors(chain = true)
public class Client extends MpBaseEntity implements EntityBaseFunction<ClientDto>{

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
    public static Client init(ClientParam in) {
        Client client = ClientConvert.CONVERT.convert(in);
        if (CollUtil.isNotEmpty(in.getClientIdList())){
            String clientIds= String.join(",", in.getClientIdList());
            client.setClientIds(clientIds);
        }
        return client;
    }

    /** 转换成dto */
    @Override
    public ClientDto toDto() {
        ClientDto application = ClientConvert.CONVERT.convert(this);
        if (StrUtil.isNotBlank(this.getClientIds())){
            List<String> collect = Arrays.stream(this.getClientIds().split(","))
                    .collect(Collectors.toList());
            application.setClientIdList(collect);
        }
        return application;
    }
}
