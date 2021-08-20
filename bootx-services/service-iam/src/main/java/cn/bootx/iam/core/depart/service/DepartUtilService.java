package cn.bootx.iam.core.depart.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.iam.core.depart.dao.DepartManager;
import cn.bootx.iam.core.depart.entity.Depart;
import cn.bootx.iam.dto.depart.DepartTreeResult;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
* 部门规则工具类
* @author xxm
* @date 2020/5/10 15:01
*/
@Service
@RequiredArgsConstructor
public class DepartUtilService {
    private final DepartManager departManager;

    /**
     * 生成机构代码 根机构_子机构_子子机构
     *
     */
    public String generateOrgCode(Long parentId) {
        // 顶级机构
        if (Objects.isNull(parentId)) {
            Depart depart = departManager.lambdaQuery()
                    .isNotNull(Depart::getParentId)
                    .orderByDesc(Depart::getOrgCategory)
                    .last("limit 1")
                    .one();
            if (Objects.isNull(depart)) {
                return "1";
            } else {
                return this.getNextCode(depart.getOrgCode());
            }
        } else {
            // 父亲
            Depart parenDepart = departManager.findById(parentId)
                    .orElseThrow(() -> new BizException("父机构不存在"));
            //最新的兄弟
            Depart depart = departManager.lambdaQuery()
                    .isNotNull(Depart::getParentId)
                    .orderByDesc(Depart::getOrgCategory)
                    .last("limit 1")
                    .one();
            if (Objects.isNull(depart)){
                return parenDepart.getOrgCode()+"_1";
            }else {
                return this.getNextCode(depart.getOrgCode());
            }
        }
    }

    /**
     * 根据前一个code，获取同级下一个code
     * 例如:当前最大code为1_2，下一个code为：1_3
     * 预防并发 TODO 需要加分布式锁
     */
    private synchronized String getNextCode(String code) {

        // 没有分隔符, 纯数字
        if (!StrUtil.contains(code,"_")){
            int i = Integer.parseInt(code);
            return String.valueOf(i+1);
        }else {
            int start = code.lastIndexOf("_");
            String sub = StrUtil.sub(code, start+1, code.length());
            int i = Integer.parseInt(sub);
            // 拼接新的 前缀+ '_'+新编号
            return StrUtil.sub(code, 0, start+1)+ (i + 1);
        }

    }

    /**
     * 构造部门树状结构
     */
    public List<DepartTreeResult> buildTreeList(List<Depart> recordList) {
        // 查出没有父级的部门
        List<DepartTreeResult> collect = recordList.stream()
                .filter(depart -> Objects.isNull(depart.getParentId()))
                .map(depart -> {
                    DepartTreeResult departTreeResult = new DepartTreeResult();
                    BeanUtil.copyProperties(depart, departTreeResult);
                    return departTreeResult;
                }).collect(Collectors.toList());

        // 查询子部门
        for (DepartTreeResult depart : collect) {
            this.findChildren(depart,recordList);
        }
        // 排序
        collect.sort(Comparator.comparing(DepartTreeResult::getDepartOrder));
        return collect;
    }

    /**
     * 递归查找子节点
     */
    private void findChildren(DepartTreeResult treeNode, List<Depart> categories) {
        for (Depart category : categories) {
            if (treeNode.getId().equals(category.getParentId())) {
                if (treeNode.getChildren() == null) {
                    treeNode.setChildren(new ArrayList<>());
                }
                DepartTreeResult childNode = new DepartTreeResult();
                BeanUtil.copyProperties(category,childNode);
                findChildren(childNode, categories);
                // 子节点
                treeNode.getChildren().add(childNode);
            }
        }
        // 排序
        if (CollUtil.isNotEmpty(treeNode.getChildren())){
            treeNode.getChildren().sort(Comparator.comparing(DepartTreeResult::getDepartOrder));
        }
    }


    /**
     * 根据id查找出下属类目的id
     * @author xxm
     * @date 2020/2/2 18:01
     */
    public static void findChildrenById(Long id, List<Depart> categories, Set<Long> ids){
        for (Depart category : categories) {
            if (Objects.equals(category.getParentId(),id)){
                ids.add(category.getId());
                findChildrenById(category.getId(),categories,ids);
            }
        }
    }
}
