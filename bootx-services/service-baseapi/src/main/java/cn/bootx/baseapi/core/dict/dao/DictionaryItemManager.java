package cn.bootx.baseapi.core.dict.dao;

import cn.bootx.baseapi.core.dict.entity.DictionaryItem;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 字典项
 * @author xxm
 * @date 2020/4/21 14:08
 */
@Repository
@AllArgsConstructor
public class DictionaryItemManager extends BaseManager<DictionaryItemMapper, DictionaryItem> {

    public boolean existsByName(String name, Long dictId){
        return lambdaQuery().eq(DictionaryItem::getName,name)
                .eq(DictionaryItem::getDictId,dictId)
                .exists();
    }

    public boolean existsByName(String name, Long dictId, Long itemId){
        return lambdaQuery().eq(DictionaryItem::getName,name)
                .eq(DictionaryItem::getDictId,dictId)
                .ne(MpBaseEntity::getId,itemId)
                .exists();
    }


    /**
     * 查询指定目录下的所有内容
     */
    public List<DictionaryItem> findByDictId(Long dictId) {
        return findAllByField(DictionaryItem::getDictId,dictId);
    }

    /**
     * 分页查询,根据字典Id
     */
    public Page<DictionaryItem> findAllByDictionaryId(Long dictId, PageParam pageParam) {
        Page<DictionaryItem> mpPage = MpUtils.getMpPage(pageParam, DictionaryItem.class);
        return lambdaQuery().eq(DictionaryItem::getDictId,dictId).page(mpPage);
    }

    public List<DictionaryItem> findByDictCode(String dictCode) {
        return findAllByField(DictionaryItem::getDictCode,dictCode);
    }
}
