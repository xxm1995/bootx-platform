package cn.bootx.iam.core.client.service;

import cn.bootx.common.core.annotation.Permission;
import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.client.dao.ClientManager;
import cn.bootx.iam.core.client.entity.Client;
import cn.bootx.iam.dto.client.ClientDto;
import cn.bootx.iam.param.client.ClientParam;
import cn.bootx.starter.query.entity.QueryParams;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 终端
 * @author xxm
 * @date 2021/8/25
 */
@Permission
@Slf4j
@Service
@RequiredArgsConstructor
public class ClientService {
    private final ClientManager clientManager;

    /**
     * 添加
     */
    public ClientDto add(ClientParam param){
        if (clientManager.existsByCode(param.getCode())) {
            throw new BizException("终端编码不得重复");
        }
        Client client = Client.init(param);
        return clientManager.save(client).toDto();
    }

    /**
     * 修改
     */
    public ClientDto update(ClientParam param){
        Client client = clientManager.findById(param.getId()).orElseThrow(() -> new BizException("终端不存在"));

        if (clientManager.existsByCode(param.getCode(),client.getId())) {
            throw new BizException("终端编码不得重复");
        }
        BeanUtil.copyProperties(param,client, CopyOptions.create().ignoreNullValue());
        return clientManager.updateById(client).toDto();
    }

    /**
     * 分页
     */
    public PageResult<ClientDto> page(PageParam pageParam,ClientParam clientParam){
        return MpUtil.convert2DtoPageResult(clientManager.page(pageParam,clientParam));
    }


    public PageResult<ClientDto> superPage(PageParam pageParam, QueryParams queryParams) {
        return MpUtil.convert2DtoPageResult(clientManager.supperPage(pageParam,queryParams));
    }

    /**
     * 获取单条
     */
    public ClientDto findById(Long id){
        return clientManager.findById(id).map(Client::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取单条
     */
    @Permission(dataScope = false,selectField = false)
    public ClientDto findByCode(String code){
        return clientManager.findByCode(code).map(Client::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取全部
     */
    public List<ClientDto> findAll(){
        return ResultConvertUtil.dtoListConvert(clientManager.findAll());
    }

    /**
     * 删除
     */
    public void delete(Long id) {
        clientManager.deleteById(id);
    }

    /**
     * 编码是否已经存在
     */
    public boolean existsByCode(String code){
        return clientManager.existsByCode(code);
    }

    /**
     * 编码是否已经存在(不包含自身)
     */
    public boolean existsByCode(String code,Long id){
        return clientManager.existsByCode(code,id);
    }

}
