package cn.bootx.goods.param.category;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

;

/**
* @author xxm
* @date 2020/11/19
*/
@Data
@Accessors(chain = true)
@Schema(title = "类目")
public class CategoryParam implements Serializable {

    private static final long serialVersionUID = 88503981680088056L;
    private Long id;

    @Schema(name = "上级类目id")
    private Long pid;

    @Schema(name = "类目名称", required = true)
    private String name;

    @Schema(name ="类目描述")
    private String description;

    @Schema(name ="序号，默认0")
    private int ordinal;

    @Schema(name = "是否叶子节点")
    private boolean leaf;

}