package cn.bootx.demo.core.perm.service;

import cn.bootx.common.core.annotation.Permission;
import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.demo.core.perm.dao.DataPermDemoManager;
import cn.bootx.demo.core.perm.entity.DataPermDemo;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * 数据权限演示
 *
 * @author xxm
 * @date 2022/2/21
 */
@Slf4j
@Service
@Permission
@RequiredArgsConstructor
public class DataPermDemoService {

    private final DataPermDemoManager dataPermDemoManager;

    /**
     * 分页
     */
    public PageResult<DataPermDemo> page(PageParam pageParam) {
        return MpUtil.convert2PageResult(dataPermDemoManager.page(pageParam));
    }

    /**
     * 获取 单条
     */
    public DataPermDemo findById(Long id) {
        return dataPermDemoManager.findById(id).orElseThrow(DataNotExistException::new);
    }

    /**
     * 添加
     */
    public void add(DataPermDemo param) {
        param.setCreatorName(SecurityUtil.getCurrentUser().map(UserDetail::getName).orElse("未知"));
        dataPermDemoManager.save(param);
    }

    /**
     * 更新
     */
    public void update(DataPermDemo param) {
        DataPermDemo dataPermDemo = dataPermDemoManager.findById(param.getId()).orElseThrow(DataNotExistException::new);
        BeanUtil.copyProperties(param, dataPermDemo, CopyOptions.create().ignoreNullValue());
        dataPermDemoManager.updateById(dataPermDemo);
    }

    /**
     * 删除
     */
    public void delete(Long id) {
        dataPermDemoManager.findById(id).orElseThrow(DataNotExistException::new);
        dataPermDemoManager.deleteById(id);
    }

}
