package cn.bootx.baseapi.core.dict.dao;

import cn.bootx.baseapi.core.dict.entity.Dictionary;
import cn.bootx.baseapi.param.dict.DictionaryParam;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Objects;

/**   
* 字典
* @author xxm
* @date 2020/11/13 
*/
@Repository
@AllArgsConstructor
public class DictionaryManager extends BaseManager<DictionaryMapper, Dictionary> {

    /**
     * 根据用户名查询重复
     */
    public boolean existsByName(String name){
        return existedByField(Dictionary::getName,name);
    }

    /**
     * 根据用户名查询重复 排除id
     */
    public boolean existsByNameAndIdNot(String name,Long id){
        return lambdaQuery().eq(Dictionary::getName,name)
                .ne(MpBaseEntity::getId,id)
                .exists();
    }

    public boolean existedById(Long id) {
        return lambdaQuery().eq(Dictionary::getId,id).exists();
    }

    public Page<Dictionary> page(PageParam pageParam, DictionaryParam param) {
        Page<Dictionary> mpPage = MpUtils.getMpPage(pageParam, Dictionary.class);
        return lambdaQuery()
                .like(Objects.nonNull(param.getName()),Dictionary::getName,param.getName())
                .like(Objects.nonNull(param.getCode()),Dictionary::getCode,param.getCode())
                .page(mpPage);
    }
}
