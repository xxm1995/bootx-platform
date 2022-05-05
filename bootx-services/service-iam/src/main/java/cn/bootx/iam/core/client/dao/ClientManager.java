package cn.bootx.iam.core.client.dao;

import cn.bootx.common.core.annotation.Permission;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.common.query.entity.QueryParams;
import cn.bootx.common.query.generator.QueryGenerator;
import cn.bootx.iam.core.client.entity.Client;
import cn.bootx.iam.param.client.ClientParam;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
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

    @Permission(dataScope = false,selectField = false)
    public Optional<Client> findByCode(String code) {
        return findByField(Client::getCode,code);
    }

    public boolean existsByCode(String code) {
        return existedByField(Client::getCode,code);
    }

    public boolean existsByCode(String code,Long id) {
        return existedByField(Client::getCode,code,id);
    }

    public Page<Client> page(PageParam pageParam, ClientParam clientParam) {
        Page<Client> mpPage = MpUtil.getMpPage(pageParam, Client.class);
        return lambdaQuery()
                .like(StrUtil.isNotBlank(clientParam.getName()),Client::getName,clientParam.getName())
                .like(StrUtil.isNotBlank(clientParam.getCode()),Client::getCode,clientParam.getCode())
                .page(mpPage);
    }

    /**
     * 超级查询
     */
    public Page<Client> supperPage(PageParam pageParam, QueryParams queryParams) {
        QueryWrapper<Client> generator = QueryGenerator.generator(queryParams);
        Page<Client> mpPage = MpUtil.getMpPage(pageParam, Client.class);
        return this.page(mpPage,generator);
    }
}
