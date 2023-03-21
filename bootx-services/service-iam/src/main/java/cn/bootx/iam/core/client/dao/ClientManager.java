package cn.bootx.iam.core.client.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.client.entity.Client;
import cn.bootx.iam.param.client.ClientParam;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * 认证应用
 *
 * @author xxm
 * @date 2022-06-27
 */
@Repository
@RequiredArgsConstructor
public class ClientManager extends BaseManager<ClientMapper, Client> {

    /**
     * 分页
     */
    public Page<Client> page(PageParam pageParam, ClientParam param) {
        Page<Client> mpPage = MpUtil.getMpPage(pageParam, Client.class);
        return lambdaQuery().like(StrUtil.isNotBlank(param.getCode()), Client::getCode, param.getCode())
            .like(StrUtil.isNotBlank(param.getName()), Client::getName, param.getName())
            .orderByDesc(MpIdEntity::getId)
            .page(mpPage);
    }

    public Optional<Client> findByCode(String code) {
        return findByField(Client::getCode, code);
    }

    public boolean existsByCode(String code) {
        return existedByField(Client::getCode, code);
    }

    public boolean existsByCode(String code, Long id) {
        return existedByField(Client::getCode, code, id);
    }

}