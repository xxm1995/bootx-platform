package cn.bootx.common.translate.cache;

import com.alibaba.ttl.TransmittableThreadLocal;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

/**
 * 字典翻译缓存
 * @author xxm
 * @date 2023/1/29
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class TranslationCacheLocal {
    private static final ThreadLocal<Cache> THREAD_LOCAL = new TransmittableThreadLocal<>();

    /**
     * TTL 设置数据
     */
    public static void put(Cache cache) {
        THREAD_LOCAL.set(cache);
    }

    /**
     * 获取TTL中的数据
     */
    public static Cache get() {
        Cache cache = Optional.ofNullable(THREAD_LOCAL.get()).orElse(new Cache());
        THREAD_LOCAL.set(cache);
        return cache;
    }

    /**
     * 清除
     */
    public static void clear() {
        THREAD_LOCAL.remove();
    }

    /**
     * 缓存信息
     */
    @Getter
    @Setter
    public static class Cache {
        /** 字典项 */
        private Set<DictItem> dictItems = new HashSet<>();
        /** 表项 */
        private Set<TableItem> tableItems = new HashSet<>();
        // 字典缓存

        // 表缓存

        public String getDictValue(){
            return null;
        }

        public void addDict(String dictCode,String code){
            dictItems.add(new DictItem(dictCode,code));
        }

        public void addTable(String table,String key,String param,String select){
            tableItems.add(new TableItem(table,key,param,select));
        }

    }

    /**
     * 要进行缓存的字典值
     */
    @AllArgsConstructor
    public static class DictItem{
        /** 字典code */
        private String dictCode;
        /** code */
        private String code;
    }
    /**
     * 要进行缓存的字典值
     */
    @AllArgsConstructor
    public static class TableItem{
        /** 表名 */
        private String table;
        /** 条件字段 */
        private String key;
        /** 条件值 */
        private Object param;
        /** 目标字段 */
        private String select;
    }
}
