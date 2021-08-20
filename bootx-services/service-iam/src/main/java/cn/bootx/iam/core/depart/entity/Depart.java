package cn.bootx.iam.core.depart.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.iam.core.depart.convert.DepartConvert;
import cn.bootx.iam.dto.depart.DepartDto;
import cn.bootx.iam.param.depart.DepartParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**   
* 部门表
* @author xxm  
* @date 2020/5/7 17:38 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("iam_depart")
public class Depart extends MpBaseEntity implements EntityBaseFunction<DepartDto> {

	/**父机构ID*/
	private Long parentId;
	/**机构/部门名称*/
	private String departName;
	/**英文名*/
	private String departNameEn;
	/**缩写*/
	private String departNameAbbr;
	/**排序*/
	private Integer departOrder;
	/**描述*/
	private String description;
	/**机构类别 1组织机构，2岗位*/
	private String orgCategory;
	/**机构类型*/
	private String orgType;
	/**机构编码*/
	private String orgCode;
	/**手机号*/
	private String mobile;
	/**传真*/
	private String fax;
	/**地址*/
	private String address;
	/**备注*/
	private String memo;
	/**状态（1启用，0不启用）*/
	private Integer status;

	public static Depart init(DepartDto in){
        return DepartConvert.CONVERT.convert(in);
    }

    public static Depart init(DepartParam in){
        return DepartConvert.CONVERT.convert(in);
    }

    @Override
    public DepartDto toDto() {
        return DepartConvert.CONVERT.convert(this);
    }
}
