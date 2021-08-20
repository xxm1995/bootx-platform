package cn.bootx.goods.core.category.handler;


import cn.bootx.goods.dto.category.CategoryDto;
import cn.bootx.goods.dto.category.CategoryTreeNode;

import java.util.ArrayList;
import java.util.List;

/**
* 类目树构建
* @author xxm
* @date 2020/11/20
*/
public class CategoryTreeHandler{

    /**
     * 构建类目树
     */
    public static List<CategoryTreeNode> build(List<CategoryDto> dtos) {
        List<CategoryTreeNode> tree = new ArrayList<>();
        for (CategoryDto dto : dtos) {
            // 顶级类目
            if (CategoryDto.ID_ROOT == dto.getPid()) {
                CategoryTreeNode treeNode = new CategoryTreeNode(dto);
                findChildren(treeNode, dtos);
                tree.add(treeNode);
            }
        }
        return tree;
    }

    /**
     * 递归查找子节点
     */
    private static void findChildren(CategoryTreeNode treeNode, List<CategoryDto> dtos) {
        for (CategoryDto dto : dtos) {
            if (treeNode.getId().equals(dto.getPid())) {
                if (treeNode.getChildren() == null) {
                    treeNode.setChildren(new ArrayList<>());
                }
                CategoryTreeNode childNode = new CategoryTreeNode(dto);
                findChildren(childNode, dtos);
                treeNode.getChildren().add(childNode);
            }
        }
    }
}
