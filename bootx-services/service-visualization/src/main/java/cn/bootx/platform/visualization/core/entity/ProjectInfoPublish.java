package cn.bootx.platform.visualization.core.entity;

import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 自定义大屏编辑时缓存信息
 *
 * @author xxm
 * @date 2023/2/21
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("report_project_info_publish")
public class ProjectInfoPublish extends MpBaseEntity {

    /** 发布的报表内容 */
    private String content;

}
