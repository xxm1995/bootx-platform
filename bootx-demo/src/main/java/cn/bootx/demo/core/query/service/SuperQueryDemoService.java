package cn.bootx.demo.core.query.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.demo.core.query.dao.SuperQueryDemoManager;
import cn.bootx.demo.core.query.entity.SuperQueryDemo;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**   
* 超级查询
* @author xxm  
* @date 2022/2/21 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class SuperQueryDemoService {
    private final SuperQueryDemoManager superQueryDemoManager;

    /**
     * 分页
     */
    public PageResult<SuperQueryDemo> page(PageParam pageParam){
        return MpUtil.convert2PageResult(superQueryDemoManager.page(pageParam));
    }

    /**
     * 获取 单条
     */
    public SuperQueryDemo findById(Long id){
        return superQueryDemoManager.findById(id).orElseThrow(DataNotExistException::new);
    }

    /**
     * 添加
     */
    public void add(SuperQueryDemo param){
        superQueryDemoManager.save(param);
    }

    /**
     * 更新
     */
    public void update(SuperQueryDemo param){
        SuperQueryDemo SuperQueryDemo = superQueryDemoManager.findById(param.getId()).orElseThrow(DataNotExistException::new);
        BeanUtil.copyProperties(param,SuperQueryDemo, CopyOptions.create().ignoreNullValue());
        superQueryDemoManager.updateById(SuperQueryDemo);
    }

    /**
     * 删除
     */
    public void delete(Long id){
        superQueryDemoManager.findById(id).orElseThrow(DataNotExistException::new);
        superQueryDemoManager.deleteById(id);
    }
}
