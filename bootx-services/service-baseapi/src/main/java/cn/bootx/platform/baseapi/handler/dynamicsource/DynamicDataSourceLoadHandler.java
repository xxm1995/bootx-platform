package cn.bootx.platform.baseapi.handler.dynamicsource;

import cn.bootx.platform.baseapi.core.dynamicsource.service.DynamicDataSourceService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * 初始化数据源函数
 * @author xxm
 * @date 2023/5/17
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class DynamicDataSourceLoadHandler {
    private final DynamicDataSourceService dynamicDataSourceService;

    @PostConstruct
    public void initLoad(){
        dynamicDataSourceService.initLoad();
    }

}
