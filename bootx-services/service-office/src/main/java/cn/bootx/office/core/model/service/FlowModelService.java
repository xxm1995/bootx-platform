package cn.bootx.office.core.model.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.office.core.model.dao.BpmModelManager;
import cn.bootx.office.core.model.entity.BpmModel;
import cn.bootx.office.dto.model.BpmModelDto;
import cn.bootx.office.param.model.FlowModelParam;
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
    private final BpmModelManager bpmModelManager;


    /**
     * 分页
     */
    public PageResult<BpmModelDto> page(PageParam pageParam, FlowModelParam flowModelParam){
        return MpUtil.convert2DtoPageResult(bpmModelManager.page(pageParam,flowModelParam));
    }

    /**
     * 获取单条
     */
    public BpmModelDto findById(Long id){
        return bpmModelManager.findById(id).map(BpmModel::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取全部
     */
    public List<BpmModelDto> findAll(){
        return ResultConvertUtil.dtoListConvert(bpmModelManager.findAll());
    }

    /**
     * 删除
     */
    public void delete(Long id){
        bpmModelManager.deleteById(id);
    }
}