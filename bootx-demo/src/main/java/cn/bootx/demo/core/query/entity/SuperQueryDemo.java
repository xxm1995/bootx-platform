package cn.bootx.demo.core.query.entity;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**   
* 超级查询演示
* @author xxm  
* @date 2022/2/21 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("demo_super_query")
@Schema(title = "超级查询演示")
public class SuperQueryDemo extends MpBaseEntity {
}
