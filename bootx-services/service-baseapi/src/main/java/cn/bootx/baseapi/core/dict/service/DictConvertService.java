package cn.bootx.baseapi.core.dict.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * 字典值转换工具类
 * @author xxm
 * @date 2022/12/15
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class DictConvertService {

    /**
     * 转换
     */
    public void convert(Object o){
        // 遍历字段

        // 筛选出带注解的


    }

    /**
     *
     */
    public Map<String,Object> convertToMap(Object o){

        return new HashMap<>();
    }

}
