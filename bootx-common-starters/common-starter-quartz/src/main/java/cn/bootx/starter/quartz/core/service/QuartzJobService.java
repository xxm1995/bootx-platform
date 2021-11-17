package cn.bootx.starter.quartz.core.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.starter.quartz.code.QuartzJobCode;
import cn.bootx.starter.quartz.core.dao.QuartzJobManager;
import cn.bootx.starter.quartz.core.entity.QuartzJob;
import cn.bootx.starter.quartz.dto.QuartzJobDto;
import cn.bootx.starter.quartz.param.QuartzJobParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

/**
* 定时任务
* @author xxm
* @date 2021/11/2
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class QuartzJobService {
    private final QuartzJobScheduler jobScheduler;
    private final QuartzJobManager quartzJobManager;

    /**
     * 添加
     */
    @Transactional(rollbackFor = Exception.class)
    public void add(QuartzJobParam param){
        QuartzJob quartzJob = QuartzJob.init(param);
        quartzJob.setState(QuartzJobCode.STOP);
        quartzJobManager.save(quartzJob);
    }

    /**
     * 更新
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(QuartzJobParam param){
        QuartzJob quartzJob = quartzJobManager.findById(param.getId())
                .orElseThrow(() -> new BizException("定时任务不存在"));
        BeanUtil.copyProperties(param,quartzJob, CopyOptions.create().ignoreNullValue());
        quartzJobManager.updateById(quartzJob);
        jobScheduler.delete(quartzJob.getId());
        if (Objects.equals(quartzJob.getState(), QuartzJobCode.RUNNING)){
            jobScheduler.add(quartzJob.getId(),quartzJob.getJobClassName(),quartzJob.getCron(),quartzJob.getParameter());
        }
    }

    /**
     * 启动
     */
    @Transactional(rollbackFor = Exception.class)
    public void start(Long id){
        QuartzJob quartzJob = quartzJobManager.findById(id)
                .orElseThrow(() -> new BizException("定时任务不存在"));
        // 非运行才进行操作
        if (!Objects.equals(quartzJob.getState(),QuartzJobCode.RUNNING)){
            quartzJob.setState(QuartzJobCode.RUNNING);
            quartzJobManager.updateById(quartzJob);
            jobScheduler.add(quartzJob.getId(),quartzJob.getJobClassName(),quartzJob.getCron(),quartzJob.getParameter());
        } else {
            throw new BizException("已经是启动状态");
        }
    }

    /**
     * 停止
     */
    @Transactional(rollbackFor = Exception.class)
    public void stop(Long id){
        QuartzJob quartzJob = quartzJobManager.findById(id)
                .orElseThrow(() -> new BizException("定时任务不存在"));
        if (!Objects.equals(quartzJob.getState(),QuartzJobCode.STOP)){
            quartzJob.setState(QuartzJobCode.STOP);
            quartzJobManager.updateById(quartzJob);
            jobScheduler.delete(id);
        } else {
            throw new BizException("已经是停止状态");
        }
    }

    /**
     * 立即执行
     */
    public void execute(Long id){
        QuartzJob quartzJob = quartzJobManager.findById(id)
                .orElseThrow(() -> new BizException("定时任务不存在"));
        jobScheduler.execute(quartzJob.getJobClassName(),quartzJob.getParameter());
    }

    /**
     * 分页
     */
    public PageResult<QuartzJobDto> page(PageParam pageParam, QuartzJobParam param){
        return MpUtils.convert2PageResult(quartzJobManager.page(pageParam,param));
    }

    /**
     * 获取单条
     */
    public QuartzJobDto findById(Long id){
        return quartzJobManager.findById(id)
                .map(QuartzJob::toDto)
                .orElse(null);
    }

    /**
     * 删除
     */
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id){
        quartzJobManager.deleteById(id);
        jobScheduler.delete(id);
    }

    /**
     * 判断是否是定时任务类
     */
    public String judgeJobClass(String jobClassName){
        try {
            jobScheduler.getJobClass(jobClassName);
        } catch (BizException e) {
            return e.getMessage();
        }
        return "";
    }

}