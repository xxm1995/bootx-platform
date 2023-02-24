package cn.bootx.visualization.core.entity;

import cn.bootx.common.core.annotation.BigField;
import cn.bootx.common.core.annotation.actable.Column;
import cn.bootx.common.core.annotation.actable.Table;
import cn.bootx.common.core.code.actable.MySqlFieldType;
import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.core.util.CollUtil;
import cn.bootx.common.jackson.util.JacksonUtil;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.visualization.dto.ProjectInfoDto;
import cn.bootx.visualization.param.ProjectInfoSave;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 自定义大屏信息
 * @author xxm
 * @date 2023/2/21
 */
@Table(comment = "自定义大屏信息")
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("report_project_info")
public class ProjectInfo extends MpBaseEntity implements EntityBaseFunction<ProjectInfoDto> {

    /** 项目名称 */
    @Column(comment = "项目名称")
    private String name;

    /**
     * 发布状态
     * @see cn.bootx.visualization.code.GoVIewCode
     */
    @Column(comment = "发布状态")
    private Integer state;

    /** 是否在编辑中 */
    @Column(comment = "是否在编辑中")
    private Boolean edit;

    /** 报表内容 */
    @BigField
    @Column(comment = "报表内容",type = MySqlFieldType.LONGTEXT)
    private String content;

    /** 预览图片id */
    @Column(comment = "预览图片id")
    private Long indexImage;

    /** 备注 */
    @Column(comment = "备注")
    private String remark;


    public static ProjectInfo init(ProjectInfoSave param){
        ProjectInfo entity = new ProjectInfo()
                .setName(param.getName())
                .setIndexImage(param.getIndexImage())
                .setRemark(param.getRemark());
        entity.setId(param.getProjectId());
        if (CollUtil.isNotEmpty(param.getContent())){
            entity.setContent(JacksonUtil.toJson(param.getContent()));
        }
        return entity;
    }

    /**
     * 转换
     */
    @Override
    public ProjectInfoDto toDto() {
        return null;
    }
}
