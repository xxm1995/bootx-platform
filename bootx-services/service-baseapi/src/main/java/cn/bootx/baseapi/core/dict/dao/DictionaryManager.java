package cn.bootx.baseapi.core.dict.dao;

import cn.bootx.baseapi.core.dict.entity.Dictionary;
import cn.bootx.baseapi.param.dict.DictionaryParam;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Repository;

/**   
* 字典
* @author xxm
* @date 2020/11/13 
*/
@Repository
@AllArgsConstructor
public class DictionaryManager extends BaseManager<DictionaryMapper, Dictionary> {

    /**
     * 根据code查询重复
     */
    public boolean existsByCode(String code){
        return existedByField(Dictionary::getCode,code);
    }

    /**
     * 根据code查询重复 排除id
     */
    public boolean existsByCode(String code, Long id){
        return existedByField(Dictionary::getCode,code,id);
    }

    public boolean existedById(Long id) {
        return lambdaQuery().eq(Dictionary::getId,id).exists();
    }

    public Page<Dictionary> page(PageParam pageParam, DictionaryParam param) {
        Page<Dictionary> mpPage = MpUtil.getMpPage(pageParam, Dictionary.class);
        return lambdaQuery()
                .orderByDesc(MpIdEntity::getId)
                .like(StrUtil.isNotBlank(param.getName()),Dictionary::getName,param.getName())
                .like(StrUtil.isNotBlank(param.getName()),Dictionary::getName,param.getName())
                .like(StrUtil.isNotBlank(param.getGroupTag()),Dictionary::getGroupTag,param.getGroupTag())
                .page(mpPage);
    }
}
