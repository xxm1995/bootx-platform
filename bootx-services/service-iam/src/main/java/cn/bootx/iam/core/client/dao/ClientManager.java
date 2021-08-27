package cn.bootx.iam.core.client.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.iam.core.client.entity.Client;
import cn.bootx.iam.param.client.ClientParam;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
* 终端
* @author xxm
* @date 2021/8/25
*/
@Repository
@RequiredArgsConstructor
public class ClientManager extends BaseManager<ClientMapper, Client> {
    public Optional<Client> findByCode(String code) {
        return findByField(Client::getCode,code);
    }

    public boolean existsByCode(String code) {
        return existedByField(Client::getCode,code);
    }

    public boolean existsByCode(String code,Long id) {
        return lambdaQuery().eq(Client::getCode,code)
                .ne(MpBaseEntity::getId,id)
                .exists();
    }

    public Page<Client> page(PageParam pageParam, ClientParam clientParam) {
        Page<Client> mpPage = MpUtils.getMpPage(pageParam, Client.class);
        return lambdaQuery()
                .like(StrUtil.isNotBlank(clientParam.getName()),Client::getName,clientParam.getName())
                .like(StrUtil.isNotBlank(clientParam.getCode()),Client::getCode,clientParam.getCode())
                .page(mpPage);
    }
}
