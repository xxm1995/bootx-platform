package cn.bootx.iam.core.depart.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.iam.core.depart.dao.DepartManager;
import cn.bootx.iam.core.depart.entity.Depart;
import cn.bootx.iam.dto.depart.DepartDto;
import cn.bootx.iam.dto.depart.DepartTreeResult;
import cn.bootx.iam.param.depart.DepartParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

/**
 *
 * @author xxm
 * @date 2020/5/7 17:42
 */
@Slf4j
@Service
@AllArgsConstructor
public class DepartService {
    private final DepartManager departManager;
    private final DepartUtilService departUtilService;

    /**
     * 添加部门
     */
    public DepartDto add(DepartParam param){
        Depart depart = Depart.init(param);

        // 先判断该对象有无父级ID,有则意味着不是最高级,否则意味着是最高级
        Long parentId = param.getParentId();

        // 部门code生成
        depart.setOrgCode(departUtilService.generateOrgCode(parentId));

        return departManager.save(depart).toDto();
    }

    /**
     * 树状展示
     */
    @Cacheable(value = "depart:tree")
    public List<DepartTreeResult> tree() {
        List<Depart> list = departManager.findAll();
        return departUtilService.buildTreeList(list);
    }

    /**
     * 根据id查询
     */
    public DepartDto findById(Long id){
        return departManager.findById(id).map(Depart::toDto).orElse(null);
    }

    /**
     * 编辑数据 编辑部门的部分数据,并保存到数据库
     */
    public DepartDto update(DepartParam param){
        // 父机构ID 机构编码 不能修改
        Depart depart = departManager.findById(param.getId()).orElseThrow(() -> new BizException("机构未找到"));
//        BeanUtil.copyProperties(param,depart, CommonCode.VERSION);
        param.setParentId(null).setOrgCode(null);
        BeanUtil.copyProperties(param,depart, CopyOptions.create().ignoreNullValue());
        return departManager.updateById(depart).toDto();
    }

    /**
     * 删除部门
     */
    public void delete(Long id){
        // 判断是否有下级部门
        if (departManager.existsParent(id)){
            throw new BizException("存在子部门,无法直接删除");
        }
        departManager.deleteById(id);

    }

    /**
     * 删除部门及下级部门
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteAndChildren(Long id){
        Depart depart = departManager.findById(id).orElse(null);
        if (Objects.isNull(depart)){
            return false;
        }
        departManager.deleteByOrgCode(depart.getOrgCode());

        // 删除下级部门
        departManager.deleteById(id);
        return true;

    }
}
