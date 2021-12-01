package cn.bootx.goods.dto.category;

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
@Schema(title = "类目DTO")
public class CategoryDto implements Serializable {
    private static final long serialVersionUID = -6395120064541083702L;

    /** 根类目 id */
    public static final long ID_ROOT = 0L;

    private Long id;

    @Schema(description="上级类目id")
    private Long pid;

    @Schema(description="类目名称", required = true)
    private String name;

    @Schema(description="类目描述")
    private String description;

    @Schema(description="序号，默认0")
    private int ordinal;

    @Schema(description= "是否叶子节点")
    private boolean leaf;

}