package cn.bootx.baseapi.core.region.entity;

import cn.bootx.baseapi.dto.region.RegionDto;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* 街道/乡镇表
* @author xxm
* @date 2022-12-24
*/
@Data
@Accessors(chain = true)
@TableName("base_street")
public class Street{

    /** 街道id */
    @TableId
    private Integer id;
    /** 街道名称 */
    private String name;
    /** 区域id */
    private Integer pid;
    /** 转换成dto */
    public RegionDto toDto() {
        return new RegionDto(id,name,4).setPid(pid);
    }
}
