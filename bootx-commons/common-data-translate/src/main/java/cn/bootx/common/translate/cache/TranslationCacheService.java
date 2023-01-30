package cn.bootx.common.translate.cache;

import cn.bootx.common.translate.cache.TranslationCacheLocal.Cache;
import cn.bootx.common.translate.domain.ConvertInfo;
import cn.hutool.core.bean.BeanUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 *
 * @author xxm
 * @date 2023/1/30
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class TranslationCacheService {


    public void initCache(Collection<?> objects){
        objects.forEach(this::initCache0);
        this.initCache();
    }

    public void initCache(Object object){
        this.initCache0(object);
        this.initCache();
    }
    /**
     * 提取要缓存的数据
     */
    private void initCache0(Object object){
        if (Objects.isNull(object)){
            return;
        }
        Cache cache = TranslationCacheLocal.get();
        // 遍历字段, 判断是否有嵌套对象
        List<ConvertInfo> convertInfoMap = Arrays.stream(BeanUtil.getPropertyDescriptors(object.getClass()))
                .map(this::initConvertInfo)
                .collect(Collectors.toList());
        // 加注解的嵌套对象进行递归处理
        convertInfoMap.stream()
                .filter(o-> Objects.nonNull(o.getTranslationResult()))
                .forEach(o->{
                    Object fieldValue = BeanUtil.getFieldValue(object, o.getName());
                    if (Objects.nonNull(fieldValue)){
                        this.translation0(fieldValue);
                    }
                });


    }

    /**
     * 翻译
     */
    private void initCache(){

    }
}
