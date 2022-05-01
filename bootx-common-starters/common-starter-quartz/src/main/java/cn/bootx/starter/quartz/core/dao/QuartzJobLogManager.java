package cn.bootx.starter.quartz.core.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.starter.quartz.core.entity.QuartzJobLog;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**   
*
* @author xxm  
* @date 2022/5/1 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class QuartzJobLogManager extends BaseManager<QuartzJobLogMapper, QuartzJobLog> {
}
