package cn.bootx.starter.audit.log.core.db.dao;

import cn.bootx.starter.audit.log.core.db.entity.DataVersionLogDb;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**   
* 
* @author xxm  
* @date 2022/1/10 
*/
@Mapper
public interface DataVersionLogDbMapper extends BaseMapper<DataVersionLogDb> {

    @Select("Select max(version) from starter_data_version where data_Name = #{dataName} and data_id =#{dataId}")
    Integer getMaxVersion(@Param("dataName") String dataName, @Param("dataId") String dataId);
}
