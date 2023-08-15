package cn.bootx.platform.miniapp.core.feedback.service;

import cn.bootx.platform.common.core.exception.DataNotExistException;
import cn.bootx.platform.common.core.rest.PageResult;
import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.common.core.util.ResultConvertUtil;
import cn.bootx.platform.common.mybatisplus.util.MpUtil;
import cn.bootx.platform.miniapp.core.feedback.dao.FeedbackInfoManager;
import cn.bootx.platform.miniapp.core.feedback.entity.FeedbackInfo;
import cn.bootx.platform.miniapp.dto.feedback.FeedbackInfoDto;
import cn.bootx.platform.miniapp.param.feedback.FeedbackInfoParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户反馈信息
 * @author xxm
 * @since 2023-08-15
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class FeedbackInfoService {
    private final FeedbackInfoManager feedbackInfoManager;

    /**
     * 添加
     */
    public void add(FeedbackInfoParam param){
        FeedbackInfo feedbackInfo = FeedbackInfo.init(param);
        feedbackInfoManager.save(feedbackInfo);
    }

    /**
     * 修改
     */
    public void update(FeedbackInfoParam param){
        FeedbackInfo feedbackInfo = feedbackInfoManager.findById(param.getId()).orElseThrow(DataNotExistException::new);

        BeanUtil.copyProperties(param,feedbackInfo, CopyOptions.create().ignoreNullValue());
        feedbackInfoManager.updateById(feedbackInfo);
    }

    /**
     * 分页
     */
    public PageResult<FeedbackInfoDto> page(PageParam pageParam,FeedbackInfoParam query){
        return MpUtil.convert2DtoPageResult(feedbackInfoManager.page(pageParam,query));
    }

    /**
     * 获取单条
     */
    public FeedbackInfoDto findById(Long id){
        return feedbackInfoManager.findById(id).map(FeedbackInfo::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取全部
     */
    public List<FeedbackInfoDto> findAll(){
        return ResultConvertUtil.dtoListConvert(feedbackInfoManager.findAll());
    }

    /**
     * 删除
     */
    public void delete(Long id){
        feedbackInfoManager.deleteById(id);
    }


    /**
     * 批量删除
     */
    public void deleteBatch(List<Long> ids){
        feedbackInfoManager.deleteByIds(ids);
    }
}
