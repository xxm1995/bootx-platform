package cn.bootx.iam.core.permission.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.permission.dao.PermissionPathManager;
import cn.bootx.iam.core.permission.entity.PermissionPath;
import cn.bootx.iam.core.upms.dao.RolePathManager;
import cn.bootx.iam.dto.permission.PermissionPathDto;
import cn.bootx.iam.param.permission.PermissionPathParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;



/**
 * 请求权限
 * @author xxm
 * @date 2020/5/10 23:20
 */
@Service
@AllArgsConstructor
public class PermissionPathService {
    private final PermissionPathManager permissionPathManager;
    private final RolePathManager rolePathManager;

    /**
     * 添加权限信息
     */
    public PermissionPathDto add(PermissionPathParam param){
        PermissionPath permissionPath = PermissionPath.init(param);
        if (permissionPathManager.existedByCode(param.getCode())){
            throw new BizException("权限code已存在");
        }
        return permissionPathManager.save(permissionPath).toDto();
    }

    /**
     * 更新权限信息
     */
    public PermissionPathDto update(PermissionPathParam param){
        PermissionPath permissionPath = permissionPathManager.findById(param.getId())
                .orElseThrow(() -> new BizException("信息不存在"));
        if (permissionPathManager.existedByCode(param.getCode(),permissionPath.getId())){
            throw new BizException("权限code已存在");
        }
        BeanUtil.copyProperties(param,permissionPath,CopyOptions.create().ignoreNullValue());
        return permissionPathManager.updateById(permissionPath).toDto();
    }

    /**
     * 删除
     */
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id){
        rolePathManager.deleteByPermission(id);
        permissionPathManager.deleteById(id);
    }

    /**
     * 获取单条
     */
    public PermissionPathDto findById(Long id){
        return permissionPathManager.findById(id).map(PermissionPath::toDto)
                .orElse(null);
    }

    /**
     * 根据ids查询权限信息
     */
    public List<PermissionPathDto> findByIds(List<Long> ids){
        return ResultConvertUtil.dtoListConvert(permissionPathManager.findAllByIds(ids));
    }

    /**
     * 列表
     */
    public List<PermissionPathDto> findAll() {
        return ResultConvertUtil.dtoListConvert(permissionPathManager.findAll());
    }

    /**
     * 权限分页
     */
    public PageResult<PermissionPathDto> page(PageParam pageParam,PermissionPathParam param){
        return MpUtil.convert2PageResult(permissionPathManager.page(pageParam,param));
    }
}
