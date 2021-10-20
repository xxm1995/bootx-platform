package cn.bootx.iam.core.dept.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.redis.RedisClient;
import cn.bootx.iam.core.dept.dao.DeptManager;
import cn.bootx.iam.core.dept.entity.Dept;
import cn.bootx.iam.dto.dept.DeptTreeResult;
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
public class DeptUtilService {
    private final DeptManager deptManager;
    private final RedisClient redisClient;

    /**
     * 生成机构代码 根机构_子机构_子子机构
     *
     */
    public String generateOrgCode(Long parentId) {
        // 顶级机构
        if (Objects.isNull(parentId)) {
            Dept dept = deptManager.lambdaQuery()
                    .isNotNull(Dept::getParentId)
                    .orderByDesc(Dept::getOrgCode)
                    .last("limit 1")
                    .one();
            if (Objects.isNull(dept)) {
                return "1";
            } else {
                return this.getNextCode(dept.getOrgCode());
            }
        } else {
            // 父亲
            Dept parenDept = deptManager.findById(parentId)
                    .orElseThrow(() -> new BizException("父机构不存在"));
            //最新的兄弟
            Dept dept = deptManager.lambdaQuery()
                    .eq(Dept::getParentId,parenDept.getId())
                    .orderByDesc(Dept::getOrgCategory)
                    .last("limit 1")
                    .one();
            if (Objects.isNull(dept)){
                return parenDept.getOrgCode()+"_1";
            }else {
                return this.getNextCode(dept.getOrgCode());
            }
        }
    }

    /**
     * 根据前一个code，获取同级下一个code
     * 例如:当前最大code为1_2，下一个code为：1_3
     * 预防并发 TODO 需要加分布式锁
     */
    private synchronized String getNextCode(String code) {
        // 获取不到锁直接抛异常
        if (!redisClient.setIfAbsent("lock:getNextCode:"+code,"",10*1000)){
            throw new BizException("生成组织机构编码冲突，请稍等后重新生成");
        }

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
    public List<DeptTreeResult> buildTreeList(List<Dept> recordList) {
        // 查出没有父级的部门
        List<DeptTreeResult> collect = recordList.stream()
                .filter(dept -> Objects.isNull(dept.getParentId()))
                .map(dept -> {
                    DeptTreeResult deptTreeResult = new DeptTreeResult();
                    BeanUtil.copyProperties(dept, deptTreeResult);
                    return deptTreeResult;
                }).collect(Collectors.toList());

        // 查询子部门
        for (DeptTreeResult dept : collect) {
            this.findChildren(dept,recordList);
        }
        // 排序
        collect.sort(Comparator.comparing(DeptTreeResult::getSortNo));
        return collect;
    }

    /**
     * 递归查找子节点
     */
    private void findChildren(DeptTreeResult treeNode, List<Dept> categories) {
        for (Dept category : categories) {
            if (treeNode.getId().equals(category.getParentId())) {
                if (treeNode.getChildren() == null) {
                    treeNode.setChildren(new ArrayList<>());
                }
                DeptTreeResult childNode = new DeptTreeResult();
                BeanUtil.copyProperties(category,childNode);
                findChildren(childNode, categories);
                // 子节点
                treeNode.getChildren().add(childNode);
            }
        }
        // 排序
        if (CollUtil.isNotEmpty(treeNode.getChildren())){
            treeNode.getChildren().sort(Comparator.comparing(DeptTreeResult::getSortNo));
        }
    }


    /**
     * 根据id查找出下属类目的id
     * @author xxm
     * @date 2020/2/2 18:01
     */
    public static void findChildrenById(Long id, List<Dept> categories, Set<Long> ids){
        for (Dept category : categories) {
            if (Objects.equals(category.getParentId(),id)){
                ids.add(category.getId());
                findChildrenById(category.getId(),categories,ids);
            }
        }
    }
}
