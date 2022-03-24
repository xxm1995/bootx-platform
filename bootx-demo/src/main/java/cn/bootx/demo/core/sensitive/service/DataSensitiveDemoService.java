package cn.bootx.demo.core.sensitive.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.demo.core.sensitive.dao.DataSensitiveDemoManager;
import cn.bootx.demo.core.sensitive.entity.DataSensitiveDemo;
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
public class DataSensitiveDemoService {
    private final DataSensitiveDemoManager manager;

    /**
     * 新增
     */
    public void add(DataSensitiveDemo param){
        manager.save(param);
    }

    /**
     * 更新
     */
    public void update(DataSensitiveDemo param){
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
    public PageResult<DataSensitiveDemo> page(PageParam pageParam){
        return MpUtil.convert2PageResult(manager.page(MpUtil.getMpPage(pageParam,DataSensitiveDemo.class)));
    }

    /**
     * 单条
     */
    public DataSensitiveDemo findById(Long id){
        return manager.findById(id).orElseThrow(DataNotExistException::new);
    }
}
