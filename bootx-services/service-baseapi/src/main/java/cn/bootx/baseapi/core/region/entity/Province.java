package cn.bootx.baseapi.core.region.entity;

import cn.bootx.baseapi.dto.region.RegionDto;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* 省份表
* @author xxm
* @date 2022-12-24
*/
@Data
@Accessors(chain = true)
@TableName("base_province")
public class Province {

    /** 区域id */
    private Integer id;
    /** 省份名称 */
    private String name;

    /** 转换成dto */
    public RegionDto toDto() {
        return new RegionDto(id,name,1);
    }

}
