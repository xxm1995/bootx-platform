package cn.bootx.common.translate.domain;

import cn.bootx.common.translate.cache.TranslationCacheLocal;
import lombok.Getter;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

/**
 * 缓存信息
 */
@Getter
@Setter
public class Cache {
    /** 字典项 */
    private Set<TranslationCacheLocal.DictItem> dictItems = new HashSet<>();
    /** 表项 */
    private Set<TranslationCacheLocal.TableItem> tableItems = new HashSet<>();
    // 字典缓存

    // 表缓存

    public String getDictValue(){
        return null;
    }

    public void addDict(String dictCode,String code){
        dictItems.add(new TranslationCacheLocal.DictItem(dictCode,code));
    }

    public void addTable(String table,String key,String param,String select){
        tableItems.add(new TranslationCacheLocal.TableItem(table,key,param,select));
    }

}
