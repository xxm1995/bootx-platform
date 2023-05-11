package cn.bootx.platform.visualization.core.service;

import cn.bootx.platform.common.core.exception.BizException;
import cn.bootx.platform.common.core.exception.DataNotExistException;
import cn.bootx.platform.common.core.rest.PageResult;
import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.common.mybatisplus.util.MpUtil;
import cn.bootx.platform.starter.file.service.FileUploadService;
import cn.bootx.platform.visualization.code.GoVIewCode;
import cn.bootx.platform.visualization.configuration.VisualizationProperties;
import cn.bootx.platform.visualization.core.dao.ProjectInfoManager;
import cn.bootx.platform.visualization.core.dao.ProjectInfoPublishManager;
import cn.bootx.platform.visualization.core.entity.ProjectInfo;
import cn.bootx.platform.visualization.core.entity.ProjectInfoPublish;
import cn.bootx.platform.visualization.dto.GoVIewPageResult;
import cn.bootx.platform.visualization.dto.OssInfo;
import cn.bootx.platform.visualization.dto.ProjectInfoDto;
import cn.bootx.platform.visualization.dto.ProjectInfoResult;
import cn.bootx.platform.visualization.param.CreateParam;
import cn.bootx.platform.visualization.param.ProjectInfoParam;
import cn.bootx.platform.visualization.param.ProjectInfoSave;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 自定义大屏数据接口
 *
 * @author xxm
 * @date 2023/2/21
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ProjectInfoService {

    private final FileUploadService fileUploadService;

    private final VisualizationProperties visualizationProperties;

    private final ProjectInfoManager projectInfoManager;

    private final ProjectInfoPublishManager publishManager;

    /**
     * 获取文件上传oss信息
     */
    public OssInfo getOssInfo() {
        String filePreviewUrlPrefix = fileUploadService.getFilePreviewUrlPrefix();
        return new OssInfo().setBucketURL(filePreviewUrlPrefix);
    }

    /**
     * 创建项目
     */
    @Transactional(rollbackFor = Exception.class)
    public ProjectInfoResult create(CreateParam param) {
        ProjectInfo info = new ProjectInfo()
                .setState(GoVIewCode.STATE_UN_PUBLISH)
                .setEdit(false)
                .setName(param.getName())
                .setRemark(param.getRemark());
        projectInfoManager.save(info);
        ProjectInfoPublish projectInfoPublish = new ProjectInfoPublish();
        projectInfoPublish.setId(info.getId());
        publishManager.save(projectInfoPublish);
        return this.toResult(info);
    }

    /**
     * 获取项目列表分页 (大屏)
     */
    public GoVIewPageResult<List<ProjectInfoResult>> pageByGoVIew(Integer page, Integer limit) {
        Page<ProjectInfo> infoPage = projectInfoManager.page(new PageParam(page, limit), new ProjectInfoSave());
        GoVIewPageResult<List<ProjectInfoResult>> pageResult = new GoVIewPageResult<>();
        pageResult.setCount(Math.toIntExact(infoPage.getTotal()));
        List<ProjectInfoResult> projectInfoResults = infoPage.getRecords()
                .stream()
                .map(this::toResult)
                .collect(Collectors.toList());
        pageResult.setData(projectInfoResults);
        return pageResult;
    }

    /**
     * 获取项目列表分页 (后台)
     */
    public PageResult<ProjectInfoDto> pageByAdmin(PageParam pageParam, ProjectInfoSave query) {
        Page<ProjectInfo> infoPage = projectInfoManager.page(pageParam, query);
        return MpUtil.convert2DtoPageResult(infoPage);
    }

    /**
     * 查询详情(后台)
     */
    public ProjectInfoDto findById(Long id) {
        return projectInfoManager.findById(id).map(ProjectInfo::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取预览(已发布)数据
     */
    public ProjectInfoResult getPublishData(Long projectId) {
        ProjectInfoResult projectInfoResult = projectInfoManager.findById(projectId)
                .map(this::toResult)
                .orElseThrow(DataNotExistException::new);
        ProjectInfoPublish projectInfoPublish = publishManager.findById(projectId)
                .orElseThrow(DataNotExistException::new);
        if (StrUtil.isBlank(projectInfoPublish.getContent())) {
            return null;
        }
        if (Objects.equals(projectInfoResult.getState(), GoVIewCode.STATE_UN_PUBLISH)) {
            return null;
        }
        return projectInfoResult.setContent(projectInfoPublish.getContent());
    }

    /**
     * 获取编辑数据
     */
    public ProjectInfoResult getEditData(Long projectId) {
        ProjectInfo projectInfo = projectInfoManager.findById(projectId).orElseThrow(DataNotExistException::new);
        if (StrUtil.isBlank(projectInfo.getContent())) {
            return null;
        }
        return this.toResult(projectInfo);
    }

    /**
     * 更新项目数据
     */
    @SuppressWarnings("unchecked")
    @Transactional(rollbackFor = Exception.class)
    public void update(ProjectInfoSave param) {
        ProjectInfo init = ProjectInfo.init(param);
        ProjectInfo projectInfo = projectInfoManager.findById(param.getProjectId())
                .orElseThrow(DataNotExistException::new);
        CopyOptions copyOptions = CopyOptions.create().ignoreNullValue().setIgnoreProperties(ProjectInfo::getVersion);
        BeanUtil.copyProperties(init, projectInfo, copyOptions);
        projectInfo.setEdit(true);
        projectInfoManager.updateById(projectInfo);
    }

    /**
     * 更新项目数据 (后台)
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateByAdmin(ProjectInfoParam param) {
        ProjectInfo projectInfo = projectInfoManager.findById(param.getId()).orElseThrow(DataNotExistException::new);
        projectInfo.setName(param.getName()).setRemark(param.getRemark());
        projectInfoManager.updateById(projectInfo);
    }

    /**
     * 发布
     */
    @Transactional(rollbackFor = Exception.class)
    public void publish(Long id) {
        ProjectInfo projectInfo = projectInfoManager.findById(id).orElseThrow(DataNotExistException::new);
        projectInfo.setState(GoVIewCode.STATE_PUBLISH).setEdit(false);
        projectInfoManager.updateById(projectInfo);
    }

    /**
     * 取消发布
     */
    @Transactional(rollbackFor = Exception.class)
    public void unPublish(Long id) {
        ProjectInfo projectInfo = projectInfoManager.findById(id).orElseThrow(DataNotExistException::new);
        projectInfo.setState(GoVIewCode.STATE_UN_PUBLISH);
        projectInfoManager.updateById(projectInfo);
    }

    /**
     * 重置编辑数据为已发布的内容
     */
    public void reset() {

    }

    /**
     * 复制
     */
    @Transactional(rollbackFor = Exception.class)
    public void copy(Long id) {
        ProjectInfo projectInfo = projectInfoManager.findById(id).orElseThrow(DataNotExistException::new);
        ProjectInfoPublish projectInfoPublish = publishManager.findById(id).orElseThrow(DataNotExistException::new);
        ProjectInfo newProjectInfo = new ProjectInfo().setName(projectInfo.getName() + "复制")
                .setContent(projectInfo.getContent())
                .setRemark(projectInfo.getRemark())
                .setState(projectInfo.getState())
                .setEdit(false)
                .setIndexImage(projectInfo.getIndexImage());
        projectInfoManager.save(newProjectInfo);
        ProjectInfoPublish newProjectInfoPublish = new ProjectInfoPublish().setContent(projectInfoPublish.getContent());
        newProjectInfoPublish.setId(newProjectInfo.getId());
        publishManager.save(newProjectInfoPublish);
    }

    /**
     * 应用编辑中的信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void enableEditContent(Long id) {
        ProjectInfo projectInfo = projectInfoManager.findById(id).orElseThrow(DataNotExistException::new);
        projectInfo.setEdit(false);
        ProjectInfoPublish publish = publishManager.findById(id).orElseThrow(DataNotExistException::new);
        publish.setContent(projectInfo.getContent());
        projectInfoManager.updateById(projectInfo);
        publishManager.updateById(publish);
    }

    /**
     * 重置编辑中的信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void resetEditContent(Long id) {
        ProjectInfo projectInfo = projectInfoManager.findById(id).orElseThrow(DataNotExistException::new);
        projectInfo.setEdit(false);
        ProjectInfoPublish publish = publishManager.findById(id).orElseThrow(DataNotExistException::new);
        projectInfo.setContent(publish.getContent());
        projectInfoManager.updateById(projectInfo);
    }

    /**
     * 删除
     */
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id) {
        ProjectInfo projectInfo = projectInfoManager.findById(id).orElseThrow(DataNotExistException::new);
        if (Objects.equals(projectInfo.getState(), GoVIewCode.STATE_PUBLISH)) {
            throw new BizException("已发布的无法删除");
        }
        projectInfoManager.deleteById(id);
        publishManager.deleteById(id);
    }

    /**
     * 转换成Result
     */
    private ProjectInfoResult toResult(ProjectInfo projectInfo) {
        ProjectInfoResult projectInfoResult = new ProjectInfoResult().setId(projectInfo.getId())
                .setProjectName(projectInfo.getName())
                .setState(projectInfo.getState())
                .setContent(projectInfo.getContent())
                .setRemarks(projectInfo.getRemark());
        // 转换访问地址
        String filePreviewUrlPrefix = fileUploadService.getFilePreviewUrlPrefix();
        if (Objects.nonNull(projectInfo.getIndexImage())) {
            projectInfoResult.setIndexImage(filePreviewUrlPrefix + projectInfo.getIndexImage());
        }
        return projectInfoResult;
    }

    /**
     * GoView服务地址
     */
    public String getGoViewUrl() {
        return visualizationProperties.getGoViewUrl();
    }

}
