package cn.bootx.iam.dto.depart;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
* @author xxm
* @date 2020/5/10 15:25
*/
@Data
@Accessors(chain = true)
@ApiModel("部门树")
@NoArgsConstructor
public class DepartTreeResult implements Serializable {
    private static final long serialVersionUID = 9065167687644450513L;

    @ApiModelProperty("ID")
    private Long id;

    @ApiModelProperty("父机构ID")
    private Long parentId;

    @ApiModelProperty("机构/部门名称")
    private String departName;

    @ApiModelProperty("英文名")
    private String departNameEn;

    @ApiModelProperty("缩写")
    private String departNameAbbr;

    @ApiModelProperty("排序")
    private Integer departOrder;

    @ApiModelProperty("描述")
    private String description;

    @ApiModelProperty("机构类别 1组织机构，2岗位")
    private String orgCategory;

    @ApiModelProperty("机构类型")
    private String orgType;

    @ApiModelProperty("机构编码")
    private String orgCode;

    @ApiModelProperty("手机号")
    private String mobile;

    @ApiModelProperty("传真")
    private String fax;

    @ApiModelProperty("地址")
    private String address;

    @ApiModelProperty("备注")
    private String memo;

    @ApiModelProperty("状态（1启用，0不启用）")
    private String status;

    @ApiModelProperty("状态（1启用，0不启用）")
    private List<DepartTreeResult> children;
}
