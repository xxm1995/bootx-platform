package cn.bootx.starter.data.perm.record;

import com.baomidou.mybatisplus.extension.plugins.handler.DataPermissionHandler;
import net.sf.jsqlparser.expression.Expression;
import org.springframework.stereotype.Component;

/**   
* 数据权限
* @author xxm  
* @date 2021/12/21 
*/
@Component
public class BootxDataPermissionHandler implements DataPermissionHandler {
    @Override
    public Expression getSqlSegment(Expression where, String mappedStatementId) {
        return where;
    }
}
