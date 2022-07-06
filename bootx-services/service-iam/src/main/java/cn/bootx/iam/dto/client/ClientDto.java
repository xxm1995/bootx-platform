package cn.bootx.iam.dto.client;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.ArrayList;
import java.util.List;

/**
 * 认证应用
 * @author xxm
 * @date 2022-06-27
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(title = "认证应用")
@Accessors(chain = true)
public class ClientDto extends BaseDto {

    @Schema(description = "编码")
    private String code;
    @Schema(description = "名称")
    private String name;
    @Schema(description = "是否系统内置")
    private Boolean system;
    @Schema(description = "是否可用")
    private Boolean enable;
    @Schema(description = "关联终端")
    private List<String> clientIdList = new ArrayList<>();
    @Schema(description = "描述")
    private String description;

}