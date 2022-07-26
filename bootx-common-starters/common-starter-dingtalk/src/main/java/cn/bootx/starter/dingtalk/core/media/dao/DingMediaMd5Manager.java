package cn.bootx.starter.dingtalk.core.media.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.starter.dingtalk.core.media.entity.DingMediaMd5;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**   
 * 钉钉
 * @author xxm  
 * @date 2022/7/26 
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class DingMediaMd5Manager extends BaseManager<DingMediaMd5Mapper, DingMediaMd5> {

    /**
     * 根据md5查询
     */
    public Optional<DingMediaMd5> findByMd5(String md5){
        return findByField(DingMediaMd5::getMd5,md5);
    }
}
