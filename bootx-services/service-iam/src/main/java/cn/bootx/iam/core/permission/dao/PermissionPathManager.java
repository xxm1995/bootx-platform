package cn.bootx.iam.core.permission.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.permission.entity.PermissionPath;
import cn.bootx.iam.param.permission.PermissionPathParam;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * 权限
* @author xxm
* @date 2020/5/10 23:27
*/
@Repository
@RequiredArgsConstructor
public class PermissionPathManager extends BaseManager<PermissionPathMapper,PermissionPath> {

    public boolean existedByCode(String code){
        return existedByField(PermissionPath::getCode,code);
    }

    public boolean existedByCode(String code,Long id){
        return existedByField(PermissionPath::getCode,code,id);
    }

    public Page<PermissionPath> page(PageParam pageParam, PermissionPathParam param) {
        Page<PermissionPath> mpPage = MpUtil.getMpPage(pageParam, PermissionPath.class);
        return lambdaQuery()
                .like(StrUtil.isNotBlank(param.getName()),PermissionPath::getName,param.getName())
                .like(StrUtil.isNotBlank(param.getCode()),PermissionPath::getCode,param.getCode())
                .page(mpPage);

    }
}
