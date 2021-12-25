package cn.bootx.iam.core.permission.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.permission.entity.PermPath;
import cn.bootx.iam.param.permission.PermPathParam;
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
public class PermPathManager extends BaseManager<PermPathMapper, PermPath> {

    public Page<PermPath> page(PageParam pageParam, PermPathParam param) {
        Page<PermPath> mpPage = MpUtil.getMpPage(pageParam, PermPath.class);
        return lambdaQuery()
                .orderByDesc(MpBaseEntity::getId)
                .like(StrUtil.isNotBlank(param.getCode()), PermPath::getCode,param.getCode())
                .like(StrUtil.isNotBlank(param.getPath()), PermPath::getPath,param.getPath())
                .like(StrUtil.isNotBlank(param.getName()), PermPath::getName,param.getName())
                .page(mpPage);

    }
}
