package cn.bootx.goods.dto.category;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
* 类目树节点
* @author xxm
* @date 2020/11/20
*/
@Data
@Accessors(chain = true)
@ApiModel(value = "类目树节点")
@NoArgsConstructor
public class CategoryTreeNode implements Serializable {

    private static final long serialVersionUID = -1587023420309803676L;
    @ApiModelProperty("是否叶节点")
    private CategoryDto data;
    @ApiModelProperty(name = "children", value = "子节点列表")
    private List<CategoryTreeNode> children;

    public CategoryTreeNode(CategoryDto dto) {
        this.data = dto;
    }

    public Long getId() {
        return data.getId();
    }
}