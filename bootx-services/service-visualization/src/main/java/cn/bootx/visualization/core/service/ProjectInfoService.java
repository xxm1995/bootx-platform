package cn.bootx.visualization.core.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.file.service.FileUploadService;
import cn.bootx.visualization.core.dao.ProjectInfoManager;
import cn.bootx.visualization.core.entity.ProjectInfo;
import cn.bootx.visualization.dto.OssInfo;
import cn.bootx.visualization.dto.PageResult;
import cn.bootx.visualization.dto.ProjectInfoResult;
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
import java.util.stream.Collectors;

/**
 * 自定义大屏数据
 * @author xxm
 * @date 2023/2/21
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ProjectInfoService {
    private final FileUploadService fileUploadService;

    private final ProjectInfoManager projectInfoManager;

    /**
     * 创建项目
     */
    public ProjectInfoResult create(CreateParam param) {
        ProjectInfo info = new ProjectInfo()
                .setState(-1)
                .setName(DateUtil.now());
        projectInfoManager.save(info);
        return this.toResult(info);
    }

    /**
     * 获取文件上传oss信息
     */
    public OssInfo getOssInfo(){
        String filePreviewUrlPrefix = fileUploadService.getFilePreviewUrlPrefix();
        return new OssInfo().setBucketURL(filePreviewUrlPrefix);
    }

    /**
     * 获取项目列表分页
     */
    public PageResult<List<ProjectInfoResult>> page(Integer page, Integer limit){

        Page<ProjectInfo> infoPage = projectInfoManager.page(new PageParam(page, limit));
        PageResult<List<ProjectInfoResult>> pageResult = new PageResult<>();
        pageResult.setCount(Math.toIntExact(infoPage.getTotal()));
        List<ProjectInfoResult> projectInfoResults = infoPage.getRecords().stream().map(this::toResult).collect(Collectors.toList());
        pageResult.setData(projectInfoResults);
        return pageResult;
    }

    /**
     * 获取数据 报表内容为空返回null
     */
    public ProjectInfoResult getData(Long projectId) {
        ProjectInfoResult projectInfoResult = projectInfoManager.findById(projectId).map(this::toResult).orElseThrow(DataNotExistException::new);
        if (StrUtil.isBlank(projectInfoResult.getContent())){
            return null;
        }
        return projectInfoResult;
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
     * 转换成Result
     */
    private ProjectInfoResult toResult(ProjectInfo projectInfo){
        ProjectInfoResult projectInfoResult = new ProjectInfoResult()
                .setId(projectInfo.getId())
                .setProjectName(projectInfo.getName())
                .setState(projectInfo.getState())
                .setContent(projectInfo.getContent())
                .setRemarks(projectInfo.getRemark());
        // 转换访问地址
        String filePreviewUrlPrefix = fileUploadService.getFilePreviewUrlPrefix();
        projectInfoResult.setIndexImage(filePreviewUrlPrefix+ projectInfo.getIndexImage());
        return projectInfoResult;
    }
}
