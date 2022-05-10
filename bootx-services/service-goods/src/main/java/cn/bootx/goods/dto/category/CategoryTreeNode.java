package cn.bootx.goods.dto.category;

import cn.bootx.goods.core.category.entity.Category;
import cn.hutool.core.bean.BeanUtil;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

;

/**
* 类目树节点
* @author xxm
* @date 2020/11/20
*/
@Data
@Accessors(chain = true)
@Schema(title = "类目树节点")
@NoArgsConstructor
public class CategoryTreeNode implements Serializable {

    private static final long serialVersionUID = -1587023420309803676L;

    @Schema(description="主键")
    private Long id;

    @Schema(description="类目名称")
    private String name;

    @Schema(description="类目描述")
    private String remark;

    @Schema(description="排序，默认0")
    private Double sortNo;

    @Schema(description="是否启用")
    private Boolean enable;

    @Schema(description= "层级")
    private Integer level;

    @Schema(description= " 图标/图片地址")
    private String image;

    @Schema(description="子节点列表")
    private List<CategoryTreeNode> children;

    public CategoryTreeNode(Category category) {
        BeanUtil.copyProperties(category,this);
    }
}