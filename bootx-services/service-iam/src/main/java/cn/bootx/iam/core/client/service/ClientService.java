package cn.bootx.iam.core.client.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtils;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.iam.core.client.dao.ClientManager;
import cn.bootx.iam.core.client.entity.Client;
import cn.bootx.iam.dto.client.ClientDto;
import cn.bootx.iam.param.client.ClientParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**   
* 
* @author xxm  
* @date 2021/8/25
*/
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
        return MpUtils.convert2PageResult(clientManager.page(pageParam,clientParam));
    }

    /**
     * 获取单条
     */
    public ClientDto findById(Long id){
        return clientManager.findById(id).map(Client::toDto).orElse(null);
    }

    /**
     * 获取全部
     */
    public List<ClientDto> findAll(){
        return ResultConvertUtils.dtoListConvert(clientManager.findAll());
    }

    public void delete(Long id) {
        clientManager.deleteById(id);
    }
}
