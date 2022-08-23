package cn.bootx.office.core.model.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.office.core.model.entity.FlowModel;
import cn.bootx.office.param.model.FlowModelParam;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * 流程模型
 * @author xxm
 * @date 2022-08-23
 */
@Repository
@RequiredArgsConstructor
public class FlowModelManager extends BaseManager<FlowModelMapper, FlowModel> {

    /**
    * 分页
    */
    public Page<FlowModel> page(PageParam pageParam, FlowModelParam param) {
        Page<FlowModel> mpPage = MpUtil.getMpPage(pageParam, FlowModel.class);
        return this.lambdaQuery()
                .select(this.getEntityClass(),MpUtil::excludeBigField)
                .orderByDesc(MpIdEntity::getId)
                .page(mpPage);
    }

    /**
     * 取消主流程
     * @param defKey
     */
    public void cancelMainProcessByDefKey(String defKey) {
        lambdaUpdate().set(FlowModel::getMainProcess,false)
                .eq(FlowModel::getDefKey,defKey)
                .update();

    }
}