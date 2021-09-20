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
import java.util.Optional;

/**
 * 字典项
 * @author xxm
 * @date 2020/4/21 14:08
 */
@Repository
@AllArgsConstructor
public class DictionaryItemManager extends BaseManager<DictionaryItemMapper, DictionaryItem> {

    public boolean existsByDictId(Long dictId){
        return existedByField(DictionaryItem::getDictId,dictId);
    }

    public boolean existsByCode(String code, Long dictId){
        return lambdaQuery().eq(DictionaryItem::getCode,code)
                .eq(DictionaryItem::getDictId,dictId)
                .exists();
    }

    public boolean existsByCode(String code, Long dictId, Long itemId){
        return lambdaQuery().eq(DictionaryItem::getCode,code)
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
        return lambdaQuery()
                .eq(DictionaryItem::getDictId,dictId)
                .orderByAsc(DictionaryItem::getSortNo)
                .orderByDesc(MpBaseEntity::getCreateTime)
                .page(mpPage);
    }

    public void updateDictCode(Long dictId, String dictCode) {
        lambdaUpdate().set(DictionaryItem::getDictCode,dictCode)
                .eq(DictionaryItem::getDictId,dictId)
                .update();
    }

    public Optional<DictionaryItem> findByDictCodeAndCode(String dictCode, String itemCode) {
        return lambdaQuery()
                .eq(DictionaryItem::getDictCode,dictCode)
                .eq(DictionaryItem::getCode,itemCode)
                .oneOpt();
    }
}
