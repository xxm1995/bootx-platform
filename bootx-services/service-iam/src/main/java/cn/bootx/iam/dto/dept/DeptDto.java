package cn.bootx.iam.dto.dept;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
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
@Schema(title = "部门")
public class DeptDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = -4511914397757014519L;

    @Schema(name = "父机构ID")
    private Long parentId;

    @Schema(name = "名称")
    private String deptName;

    @Schema(name = "排序")
    private Double sortNo;

    /**
     * @see cn.bootx.iam.code.OrgCategoryCode
     */
    @Schema(name = "机构类别")
    private Integer orgCategory;

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

}
