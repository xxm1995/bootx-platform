package cn.bootx.goods.param.category;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/11/19
*/
@Data
@Accessors(chain = true)
@ApiModel(value = "类目")
public class CategoryParam implements Serializable {

    private static final long serialVersionUID = 88503981680088056L;
    private Long id;

    @ApiModelProperty(name = "pid", value = "上级类目id")
    private Long pid;

    @ApiModelProperty(name = "name", value = "类目名称", required = true)
    private String name;

    @ApiModelProperty(name = "description", value = "类目描述")
    private String description;

    @ApiModelProperty(name = "ordinal", value = "序号，默认0")
    private int ordinal;

    @ApiModelProperty("是否叶子节点")
    private boolean leaf;

}