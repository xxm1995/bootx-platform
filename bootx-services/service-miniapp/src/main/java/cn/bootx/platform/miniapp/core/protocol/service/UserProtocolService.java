package cn.bootx.platform.miniapp.core.protocol.service;

import cn.bootx.platform.common.core.exception.DataNotExistException;
import cn.bootx.platform.common.core.rest.PageResult;
import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.common.core.util.ResultConvertUtil;
import cn.bootx.platform.common.mybatisplus.util.MpUtil;
import cn.bootx.platform.miniapp.core.protocol.dao.UserProtocolManager;
import cn.bootx.platform.miniapp.core.protocol.entity.UserProtocol;
import cn.bootx.platform.miniapp.dto.protocol.UserProtocolDto;
import cn.bootx.platform.miniapp.param.protocol.UserProtocolParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户协议
 * @author xxm
 * @since 2023-08-02
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class UserProtocolService {
    private final UserProtocolManager userProtocolManager;

    /**
     * 添加
     */
    public void add(UserProtocolParam param){
        UserProtocol userProtocol = UserProtocol.init(param);
        userProtocolManager.save(userProtocol);
    }

    /**
     * 修改
     */
    public void update(UserProtocolParam param){
        UserProtocol userProtocol = userProtocolManager.findById(param.getId()).orElseThrow(DataNotExistException::new);

        BeanUtil.copyProperties(param,userProtocol, CopyOptions.create().ignoreNullValue());
        userProtocolManager.updateById(userProtocol);
    }

    /**
     * 分页
     */
    public PageResult<UserProtocolDto> page(PageParam pageParam,UserProtocolParam userProtocolParam){
        return MpUtil.convert2DtoPageResult(userProtocolManager.page(pageParam,userProtocolParam));
    }

    /**
     * 获取单条
     */
    public UserProtocolDto findById(Long id){
        return userProtocolManager.findById(id).map(UserProtocol::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取全部
     */
    public List<UserProtocolDto> findAll(){
        return ResultConvertUtil.dtoListConvert(userProtocolManager.findAll());
    }

    /**
     * 删除
     */
    public void delete(Long id){
        userProtocolManager.deleteById(id);
    }
}
