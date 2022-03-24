package cn.bootx.demo.core.encrypt.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.demo.core.encrypt.dao.DataEncryptDemoManager;
import cn.bootx.demo.core.encrypt.entity.DataEncryptDemo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
*
* @author xxm
* @date 2022/3/24
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class DataEncryptDemoService {
    private final DataEncryptDemoManager manager;

    /**
     * 新增
     */
    public void add(DataEncryptDemo param){
        manager.save(param);
    }

    /**
     * 更新
     */
    public void update(DataEncryptDemo param){
        manager.updateById(param);
    }

    /**
     * 删除
     */
    public void delete(Long id){
        manager.deleteById(id);
    }

    /**
     * 分页
     */
    public PageResult<DataEncryptDemo> page(PageParam pageParam){
        return MpUtil.convert2PageResult(manager.page(MpUtil.getMpPage(pageParam,DataEncryptDemo.class)));
    }

    /**
     * 单条
     */
    public DataEncryptDemo findById(Long id){
        return manager.findById(id).orElseThrow(DataNotExistException::new);
    }
}
