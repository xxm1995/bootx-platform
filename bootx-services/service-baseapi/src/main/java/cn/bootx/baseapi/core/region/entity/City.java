package cn.bootx.baseapi.core.region.entity;

import cn.bootx.baseapi.dto.region.RegionDto;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* 城市表
* @author xxm
* @date 2022-12-24
*/
@Data
@Accessors(chain = true)
@TableName("base_city")
public class City {

    /** 区域id */
    @TableId
    private Integer id;
    /** 城市名称 */
    private String name;
    /** 省份id */
    private Integer pid;
    /** 转换成dto */
    public RegionDto toDto() {
        return new RegionDto(id,name,2).setPid(pid);
    }
}
