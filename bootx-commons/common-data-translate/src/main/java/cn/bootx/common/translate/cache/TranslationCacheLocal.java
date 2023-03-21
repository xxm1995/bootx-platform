package cn.bootx.common.translate.cache;

import com.alibaba.ttl.TransmittableThreadLocal;
import com.google.common.base.Objects;
import lombok.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

/**
 * 字典翻译缓存
 *
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
    public static class Cache {

        /** 字典项 */
        private final Set<DictItem> dictItems = new HashSet<>();

        /** 表项 */
        private final Set<TableItem> tableItems = new HashSet<>();

        /** 字典缓存 */
        private final Set<DictItemValue> dictItemCaches = new HashSet<>();

        /** 表缓存 */
        private final Set<TableItemValue> tableItemCaches = new HashSet<>();

        public String getDictValue(String dicCode, String code) {
            return dictItemCaches.stream()
                .filter(o -> Objects.equal(dicCode, o.getDictCode()) && Objects.equal(code, o.getCode()))
                .findFirst()
                .map(DictItemValue::getValue)
                .orElse(null);
        }

        public Object getTableValue(String table, String key, String param, String select) {
            return null;
        }

        public void addDict(String dictCode, String code) {
            dictItems.add(new DictItem(dictCode, code));
        }

        public void addTable(String table, String key, String param, String select) {
            tableItems.add(new TableItem(table, key, param, select));
        }

        public void addDictCache(String dictCode, String code, String value) {
            dictItemCaches.add(new DictItemValue(dictCode, code, value));
        }

        public void addTableCache(String table, String key, String param, String select, String value) {
            tableItemCaches.add(new TableItemValue(table, key, param, select, value));
        }

    }

    /**
     * 要进行缓存的字典值
     */
    @AllArgsConstructor
    @Getter
    @EqualsAndHashCode
    public static class DictItem {

        /** 字典code */
        private String dictCode;

        /** code */
        private String code;

    }

    @Getter
    public static class DictItemValue extends DictItem {

        private final String value;

        public DictItemValue(String dictCode, String code, String value) {
            super(dictCode, code);
            this.value = value;
        }

    }

    /**
     * 要进行缓存的字典值
     */
    @AllArgsConstructor
    @EqualsAndHashCode
    public static class TableItem {

        /** 表名 */
        private String table;

        /** 条件字段 */
        private String key;

        /** 条件值 */
        private Object param;

        /** 目标字段 */
        private String select;

    }

    @Getter
    public static class TableItemValue extends TableItem {

        private Object value;

        public TableItemValue(String table, String key, Object param, String select, Object value) {
            super(table, key, param, select);
            this.value = value;
        }

    }

}
