package cn.bootx.iam.dto.dept;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/5/7 18:29
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel("部门")
public class DeptDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = -4511914397757014519L;

    @ApiModelProperty("父机构ID")
    private Long parentId;

    @ApiModelProperty("名称")
    private String deptName;

    @ApiModelProperty("排序")
    private Double sortNo;

    @ApiModelProperty("机构类别 1组织机构，2岗位")
    private String orgCategory;

    @ApiModelProperty("机构编码")
    private String orgCode;

    @ApiModelProperty("手机号")
    private String mobile;

    @ApiModelProperty("传真")
    private String fax;

    @ApiModelProperty("地址")
    private String address;

    @ApiModelProperty("备注")
    private String remark;

}
