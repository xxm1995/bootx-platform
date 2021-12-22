package cn.bootx.starter.data.perm.data;

import cn.bootx.common.core.annotation.Permission;
import cn.bootx.common.core.code.CommonCode;
import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.starter.auth.exception.NotLoginException;
import cn.bootx.starter.data.perm.configuration.DataPermProperties;
import cn.bootx.starter.data.perm.local.DataPermContextHolder;
import com.baomidou.mybatisplus.core.toolkit.PluginUtils;
import com.baomidou.mybatisplus.extension.parser.JsqlParserSupport;
import com.baomidou.mybatisplus.extension.plugins.inner.InnerInterceptor;
import lombok.RequiredArgsConstructor;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.LongValue;
import net.sf.jsqlparser.expression.operators.conditional.AndExpression;
import net.sf.jsqlparser.expression.operators.relational.ExpressionList;
import net.sf.jsqlparser.expression.operators.relational.InExpression;
import net.sf.jsqlparser.expression.operators.relational.ItemsList;
import net.sf.jsqlparser.schema.Column;
import net.sf.jsqlparser.schema.Table;
import net.sf.jsqlparser.statement.select.*;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Component;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
* 数据权限处理器
* @author xxm
* @date 2021/12/22
*/
@Component
@RequiredArgsConstructor
public class DataPermInterceptor extends JsqlParserSupport implements InnerInterceptor {
    private final DataPermProperties dataPermProperties;
    private final DataPermHandler dataPermHandler;

    @Override
    public void beforeQuery(Executor executor, MappedStatement ms, Object parameter, RowBounds rowBounds, ResultHandler resultHandler, BoundSql boundSql) throws SQLException {
        // 配置是否开启了权限控制
        if (!dataPermProperties.isEnableDataPerm()){
            return;
        }
        // 是否添加了对应的注解来开启数据权限控制
        Permission permission = DataPermContextHolder.getPermission();
        if (Objects.isNull(permission) || !permission.dataPerm()){
            return;
        }
        // 检查是否已经登录和是否是超级管理员
        boolean admin = DataPermContextHolder.getUserDetail()
                .map(UserDetail::isAdmin)
                .orElseThrow(NotLoginException::new);
        // 是否超级管理员
        if (admin){
            return;
        }
        PluginUtils.MPBoundSql mpBs = PluginUtils.mpBoundSql(boundSql);
        mpBs.sql(this.parserSingle(mpBs.sql(), ms.getId()));
    }

    /**
     * 查询处理
     */
    @Override
    protected void processSelect(Select select, int index, String sql, Object obj) {
        SelectBody selectBody = select.getSelectBody();
        if (selectBody instanceof PlainSelect) {
            this.setWhere((PlainSelect) selectBody);
        } else if (selectBody instanceof SetOperationList) {
            SetOperationList setOperationList = (SetOperationList) selectBody;
            List<SelectBody> selectBodyList = setOperationList.getSelects();
            selectBodyList.forEach(s -> this.setWhere((PlainSelect) s));
        }
    }

    /**
     * 设置 where 条件
     *
     * @param plainSelect  查询对象
     */
    protected void setWhere(PlainSelect plainSelect) {
        Expression sqlSegment = this.processPermSql(plainSelect.getWhere());
        if (null != sqlSegment) {
            plainSelect.setWhere(sqlSegment);
        }
    }

    /**
     * 配置权限
     *
     * @param where 表达式
     * @return 新的表达式
     */
    protected Expression processPermSql(Expression where) {
        DataPermProperties.DataPerm dataPerm = dataPermProperties.getDataPerm();

        // 创建嵌套子查询
        PlainSelect plainSelect = new PlainSelect();
        // 设置查询字段
        SelectExpressionItem selectItem = new SelectExpressionItem();
        selectItem.setExpression(new Column(dataPerm.getQueryField()));
        plainSelect.addSelectItems(selectItem);
        // 过滤重复的子查询结果
        plainSelect.setDistinct(new Distinct());
        // 设置所查询表
        plainSelect.setFromItem(new Table(dataPerm.getTable()));

        // 设置查询条件
        List<Expression> longList = dataPermHandler.whereIds().stream()
                .map(LongValue::new)
                .collect(Collectors.toList());
        // 构造空查询
        if (longList.size() == 0){
            longList.add(null);
        }

        ItemsList deptIdList = new ExpressionList(longList);
        plainSelect.setWhere(new InExpression(new Column(dataPerm.getWhereField()), deptIdList));

        // 拼接子查询
        SubSelect subSelect = new SubSelect();
        subSelect.setSelectBody(plainSelect);
        InExpression inExpression = new InExpression(new Column(CommonCode.CREATOR), subSelect);

        return new AndExpression(inExpression, where);
    }
}
