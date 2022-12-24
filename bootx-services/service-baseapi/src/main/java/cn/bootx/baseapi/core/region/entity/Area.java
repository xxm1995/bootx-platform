package cn.bootx.baseapi.core.region.entity;

import cn.bootx.baseapi.dto.region.RegionDto;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* 区域表(县区)
* @author xxm
* @date 2022-12-24
*/
@Data
@Accessors(chain = true)
@TableName("base_area")
public class Area{

    /** 区域id */
    @TableId
    private Integer id;
    /** 区域名称 */
    private String name;
    /** 城市id */
    private Integer pid;

    /** 转换成dto */
    public RegionDto toDto() {
        return new RegionDto(id,name,3).setPid(pid);
    }
}
