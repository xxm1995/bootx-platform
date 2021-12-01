package cn.bootx.iam.dto.dept;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
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
@Schema(title = "部门树")
@NoArgsConstructor
public class DeptTreeResult implements Serializable {
    private static final long serialVersionUID = 9065167687644450513L;

    @Schema(name = "ID")
    private Long id;

    @Schema(name = "父机构ID")
    private Long parentId;

    @Schema(name = "机构/部门名称")
    private String deptName;

    @Schema(name = "排序")
    private Double sortNo;

    @Schema(name = "机构类别 1组织机构，2岗位")
    private String orgCategory;

    @Schema(name = "机构类型")
    private String orgType;

    @Schema(name = "机构编码")
    private String orgCode;

    @Schema(name = "手机号")
    private String mobile;

    @Schema(name = "传真")
    private String fax;

    @Schema(name = "地址")
    private String address;

    @Schema(name = "备注")
    private String remark;


    @Schema(name = "部门树")
    private List<DeptTreeResult> children;
}
