package cn.bootx.iam.core.dept.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.iam.core.dept.convert.DeptConvert;
import cn.bootx.iam.dto.dept.DeptDto;
import cn.bootx.iam.param.dept.DeptParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 部门表
 *
 * @author xxm
 * @date 2020/5/7 17:38
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("iam_dept")
public class Dept extends MpBaseEntity implements EntityBaseFunction<DeptDto> {

    /** 父机构ID */
    private Long parentId;

    /** 机构/部门名称 */
    private String deptName;

    /** 排序 */
    private Double sortNo;

    /**
     * 机构类别
     * @see cn.bootx.iam.code.OrgCategoryCode
     */
    private Integer orgCategory;

    /** 机构编码 */
    private String orgCode;

    /** 手机号 */
    private String mobile;

    /** 传真 */
    private String fax;

    /** 地址 */
    private String address;

    /** 备注 */
    private String remark;

    public static Dept init(DeptParam in) {
        return DeptConvert.CONVERT.convert(in);
    }

    @Override
    public DeptDto toDto() {
        return DeptConvert.CONVERT.convert(this);
    }

}
