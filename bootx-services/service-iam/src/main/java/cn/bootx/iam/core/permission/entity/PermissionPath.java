package cn.bootx.iam.core.permission.entity;


import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.iam.core.permission.convert.PermissionConvert;
import cn.bootx.iam.dto.permission.PermissionPathDto;
import cn.bootx.iam.param.permission.PermissionPathParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 权限资源(url请求)
* @author xxm  
* @date 2020/5/10 23:09 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("iam_permission_path")
public class PermissionPath extends MpBaseEntity implements EntityBaseFunction<PermissionPathDto> {

    /** 权限的标识 */
    private String code;

    /** 权限名称 */
    private String name;

    /** 启用 */
    private boolean enable;

    /** 权限描述 */
    private String description;

    public static PermissionPath init(PermissionPathParam param){
        return PermissionConvert.CONVERT.convert(param);
    }

    @Override
    public PermissionPathDto toDto() {
        return PermissionConvert.CONVERT.convert(this);
    }
}
