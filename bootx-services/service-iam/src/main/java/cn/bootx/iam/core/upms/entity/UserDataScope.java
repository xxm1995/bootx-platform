package cn.bootx.iam.core.upms.entity;

import cn.bootx.common.mybatisplus.base.MpIdEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**   
* 用户数据范围关联关系
* @author xxm  
* @date 2021/12/23 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("iam_user_data_scope")
public class UserDataScope extends MpIdEntity {

    /** 用户id */
    private Long userId;

    /** 部门id */
    private Long deptId;
}
