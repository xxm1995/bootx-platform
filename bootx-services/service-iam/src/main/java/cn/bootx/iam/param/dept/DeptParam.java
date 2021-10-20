package cn.bootx.iam.param.dept;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/5/7 18:29
*/
@Data
@Accessors(chain = true)
@ApiModel("部门参数")
public class DeptParam implements Serializable {
    private static final long serialVersionUID = -3523887187454705868L;

    @ApiModelProperty("主键")
    private Long id;

    @ApiModelProperty("父机构ID")
    private Long parentId;

    @ApiModelProperty("名称")
    private String deptName;

    @ApiModelProperty("排序")
    private Double sortNo;

    @ApiModelProperty("机构类别 1组织机构，2岗位")
    private Integer orgCategory;

    @ApiModelProperty("手机号")
    private String mobile;

    @ApiModelProperty("传真")
    private String fax;

    @ApiModelProperty("地址")
    private String address;

    @ApiModelProperty("备注")
    private String remark;

}
