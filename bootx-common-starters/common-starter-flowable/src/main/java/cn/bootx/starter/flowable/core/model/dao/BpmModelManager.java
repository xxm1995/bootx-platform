package cn.bootx.starter.flowable.core.model.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.starter.flowable.core.model.entity.BpmModel;
import cn.bootx.starter.flowable.param.model.BpmModelParam;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * 流程模型
 * @author xxm
 * @date 2022-08-23
 */
@Repository
@RequiredArgsConstructor
public class BpmModelManager extends BaseManager<BpmModelMapper, BpmModel> {

    /**
    * 分页
    */
    public Page<BpmModel> page(PageParam pageParam, BpmModelParam param) {
        Page<BpmModel> mpPage = MpUtil.getMpPage(pageParam, BpmModel.class);
        return this.lambdaQuery()
                .select(this.getEntityClass(),MpUtil::excludeBigField)
                .like(StrUtil.isNotBlank(param.getName()),BpmModel::getName,param.getName())
                .orderByDesc(MpIdEntity::getId)
                .page(mpPage);
    }

    /**
     * 取消主流程
     */
    public void cancelMainProcessByDefKey(String defKey) {
        lambdaUpdate().set(BpmModel::getMainProcess,false)
                .eq(BpmModel::getDefKey,defKey)
                .update();

    }

    /**
     * 获取生效并部署的主流程列表
     */
    public List<BpmModel> findMainProcess() {
        return findAllByField(BpmModel::getMainProcess,true);
    }

    /**
     * 根据流程定义id获取模型信息
     */
    public Optional<BpmModel> findByDefId(String defId){
        return findByField(BpmModel::getDefId,defId);
    }
}