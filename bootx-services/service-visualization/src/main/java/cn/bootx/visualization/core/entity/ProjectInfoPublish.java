package cn.bootx.visualization.core.entity;

import cn.bootx.common.core.annotation.actable.Column;
import cn.bootx.common.core.annotation.actable.Table;
import cn.bootx.common.core.code.actable.MySqlFieldType;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 自定义大屏编辑时缓存信息
 * @author xxm
 * @date 2023/2/21
 */
@Table(comment = "自定义大屏发布信息")
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("report_project_info_publish")
public class ProjectInfoPublish extends MpBaseEntity {

    /** 发布的报表内容 */
    @Column(comment = "报表内容",type = MySqlFieldType.LONGTEXT)
    private String content;

}
