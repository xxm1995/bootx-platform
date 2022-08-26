package cn.bootx.office.core.model.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.office.core.model.entity.BpmModel;
import cn.bootx.office.param.model.BpmModelParam;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

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
                .orderByDesc(MpIdEntity::getId)
                .page(mpPage);
    }

    /**
     * 取消主流程
     * @param defKey
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
}