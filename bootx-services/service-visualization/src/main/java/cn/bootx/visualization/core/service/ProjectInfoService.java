package cn.bootx.visualization.core.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.starter.file.configuration.FileUploadProperties;
import cn.bootx.visualization.core.dao.ProjectInfoManager;
import cn.bootx.visualization.core.entity.ProjectInfo;
import cn.bootx.visualization.dto.OssInfo;
import cn.bootx.visualization.dto.PageResult;
import cn.bootx.visualization.dto.ProjectInfoDto;
import cn.bootx.visualization.param.CreateParam;
import cn.bootx.visualization.param.ProjectInfoParam;
import cn.bootx.visualization.param.PublishParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 自定义大屏数据
 * @author xxm
 * @date 2023/2/21
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ProjectInfoService {
    private final FileUploadProperties uploadProperties;

    private final ProjectInfoManager projectInfoManager;

    /**
     * 创建项目
     */
    public ProjectInfoDto create(CreateParam param) {
        ProjectInfo info = new ProjectInfo()
                .setState(-1)
                .setName(DateUtil.now());
        projectInfoManager.save(info);
        return info.toDto();
    }

    /**
     * 获取文件上传oss信息
     */
    public OssInfo getOssInfo(){
        return new OssInfo().setBucketURL(uploadProperties.getServerUrl());
    }

    /**
     * 获取项目列表分页
     */
    public PageResult<List<ProjectInfoDto>> page(Integer page, Integer limit){

        Page<ProjectInfo> infoPage = projectInfoManager.page(new PageParam(page, limit));
        PageResult<List<ProjectInfoDto>> pageResult = new PageResult<>();
        pageResult.setCount(infoPage.getTotal());
        pageResult.setData(ResultConvertUtil.dtoListConvert(infoPage.getRecords()));
        return pageResult;
    }

    /**
     * 获取数据 报表内容为空返回null
     */
    public ProjectInfoDto getData(Long projectId) {
        ProjectInfoDto projectInfoDto = projectInfoManager.findById(projectId).map(ProjectInfo::toDto).orElseThrow(DataNotExistException::new);
        if (StrUtil.isBlank(projectInfoDto.getContent())){
            return null;
        }
        return projectInfoDto;
    }

    /**
     * 更新项目数据
     */
    @SuppressWarnings("unchecked")
    @Transactional(rollbackFor = Exception.class)
    public void update(ProjectInfoParam param) {
        ProjectInfo init = ProjectInfo.init(param);
        ProjectInfo projectInfo = projectInfoManager.findById(param.getProjectId()).orElseThrow(DataNotExistException::new);
        CopyOptions copyOptions = CopyOptions.create()
                .ignoreNullValue()
                .setIgnoreProperties(ProjectInfo::getVersion);
        BeanUtil.copyProperties(init,projectInfo,copyOptions);
        projectInfoManager.updateById(projectInfo);
    }

    /**
     * 发布/未发布
     */
    @Transactional(rollbackFor = Exception.class)
    public void publish(PublishParam param){
        ProjectInfo projectInfo = projectInfoManager.findById(param.getId()).orElseThrow(DataNotExistException::new);
        projectInfo.setState(param.getState());
        projectInfoManager.updateById(projectInfo);
    }
    /**
     * 删除
     */
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id){
        projectInfoManager.deleteById(id);
    }


    /**
     * 转换成dto
     */
    private ProjectInfoDto toDto(){
        return null;
    }
}
