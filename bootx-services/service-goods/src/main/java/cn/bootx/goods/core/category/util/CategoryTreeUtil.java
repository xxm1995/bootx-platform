package cn.bootx.goods.core.category.util;


import cn.bootx.goods.core.category.entity.Category;
import cn.bootx.goods.dto.category.CategoryTreeNode;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
* 类目树构建
* @author xxm
* @date 2020/11/20
*/
public class CategoryTreeUtil {

    /**
     * 构建类目树
     */
    public static List<CategoryTreeNode> build(List<Category> categories) {
        List<CategoryTreeNode> tree = new ArrayList<>();
        for (Category category : categories) {
            // 顶级类目
            if (Objects.isNull(category.getPid())) {
                CategoryTreeNode treeNode = new CategoryTreeNode(category);
                findChildren(treeNode, categories);
                tree.add(treeNode);
            }
        }
        return tree;
    }

    /**
     * 递归查找子节点
     */
    private static void findChildren(CategoryTreeNode treeNode, List<Category> categories) {
        for (Category category : categories) {
            if (Objects.equals(treeNode.getId(),category.getPid())) {
                if (treeNode.getChildren() == null) {
                    treeNode.setChildren(new ArrayList<>());
                }
                CategoryTreeNode childNode = new CategoryTreeNode(category);
                findChildren(childNode, categories);
                treeNode.getChildren().add(childNode);
            }
        }
    }
}
