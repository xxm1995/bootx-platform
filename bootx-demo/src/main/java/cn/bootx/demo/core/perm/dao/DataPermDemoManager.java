package cn.bootx.demo.core.perm.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.demo.core.perm.entity.DataPermDemo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**   
* 数据权限演示
* @author xxm  
* @date 2022/2/21 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class DataPermDemoManager extends BaseManager<DataPermDemoMapper, DataPermDemo> {
    private final DataPermDemoMapper dataPermDemoMapper;

    /**
     * 分页
     */
    public Page<DataPermDemo> page(PageParam pageParam){
        Page<DataPermDemo> mpPage = MpUtil.getMpPage(pageParam, DataPermDemo.class);
        return lambdaQuery()
                .orderByDesc(DataPermDemo::getCreateTime)
                .page(mpPage);
    }
}
