package cn.bootx.office.core.model.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.office.core.model.dao.FlowModelManager;
import cn.bootx.office.core.model.entity.FlowModel;
import cn.bootx.office.dto.model.FlowModelDto;
import cn.bootx.office.param.model.FlowModelParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 流程模型
 * @author xxm
 * @date 2022-08-23
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class FlowModelService {
    private final FlowModelManager flowModelManager;

    /**
     * 修改
     */
    public void update(FlowModelParam param){
        FlowModel flowModel = flowModelManager.findById(param.getId()).orElseThrow(DataNotExistException::new);

        BeanUtil.copyProperties(param,flowModel, CopyOptions.create().ignoreNullValue());
        flowModelManager.updateById(flowModel);
    }

    /**
     * 分页
     */
    public PageResult<FlowModelDto> page(PageParam pageParam,FlowModelParam flowModelParam){
        return MpUtil.convert2DtoPageResult(flowModelManager.page(pageParam,flowModelParam));
    }

    /**
     * 获取单条
     */
    public FlowModelDto findById(Long id){
        return flowModelManager.findById(id).map(FlowModel::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取全部
     */
    public List<FlowModelDto> findAll(){
        return ResultConvertUtil.dtoListConvert(flowModelManager.findAll());
    }

    /**
     * 删除
     */
    public void delete(Long id){
        flowModelManager.deleteById(id);
    }
}