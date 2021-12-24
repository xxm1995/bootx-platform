package cn.bootx.iam.core.scope.entity;

import cn.bootx.common.mybatisplus.base.MpIdEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
* 数据范围部门关联配置
* @author xxm
* @date 2021/12/23
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
@TableName("iam_data_scope_dept")
public class DataScopeDept extends MpIdEntity {

    /** 数据范围id */
    private Long dataScopeId;

    /** 部门id */
    private Long deptId;
}
