package cn.bootx.common.mybatisplus.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.enums.SqlMethod;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.TableInfo;
import com.baomidou.mybatisplus.core.metadata.TableInfoHelper;
import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.core.toolkit.ReflectionKit;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.conditions.query.QueryChainWrapper;
import com.baomidou.mybatisplus.extension.conditions.update.LambdaUpdateChainWrapper;
import com.baomidou.mybatisplus.extension.conditions.update.UpdateChainWrapper;
import com.baomidou.mybatisplus.extension.kotlin.KtQueryChainWrapper;
import com.baomidou.mybatisplus.extension.kotlin.KtUpdateChainWrapper;
import com.baomidou.mybatisplus.extension.toolkit.ChainWrappers;
import com.baomidou.mybatisplus.extension.toolkit.SqlHelper;
import org.apache.ibatis.binding.MapperMethod;
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.*;
import java.util.function.BiConsumer;

/**
 * 自定义的基础数据库Repository操作类
 * @author xxm
 * @date 2020/4/15 14:26
 */
public class BaseManager<M extends BaseMapper<T>, T>{

    /**
     * 默认批次提交数量
     */
    int DEFAULT_BATCH_SIZE = 1000;

    protected Log log = LogFactory.getLog(getClass());

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    protected M baseMapper;

    public M getBaseMapper() {
        return baseMapper;
    }

    public Class<T> getEntityClass() {
        return currentModelClass();
    }


    @SuppressWarnings("unchecked")
    protected Class<M> currentMapperClass() {
        return (Class<M>) ReflectionKit.getSuperClassGenericType(this.getClass(), BaseManager.class, 0);
    }

    @SuppressWarnings("unchecked")
    protected Class<T> currentModelClass() {
        return (Class<T>) ReflectionKit.getSuperClassGenericType(this.getClass(), BaseManager.class, 1);
    }

    /*
     * 以下的方法使用介绍:
     *
     * 一. 名称介绍
     * 1. 方法名带有 query 的为对数据的查询操作, 方法名带有 update 的为对数据的修改操作
     * 2. 方法名带有 lambda 的为内部方法入参 column 支持函数式的
     * 二. 支持介绍
     *
     * 1. 方法名带有 query 的支持以 {@link ChainQuery} 内部的方法名结尾进行数据查询操作
     * 2. 方法名带有 update 的支持以 {@link ChainUpdate} 内部的方法名为结尾进行数据修改操作
     *
     * 三. 使用示例,只用不带 lambda 的方法各展示一个例子,其他类推
     * 1. 根据条件获取一条数据: `query().eq("column", value).one()`
     * 2. 根据条件删除一条数据: `update().eq("column", value).remove()`
     *
     */

    /**
     * 链式查询 普通
     *
     * @return QueryWrapper 的包装类
     */
    public QueryChainWrapper<T> query() {
        return ChainWrappers.queryChain(getBaseMapper());
    }

    /**
     * 链式查询 lambda 式
     * <p>注意：不支持 Kotlin </p>
     *
     * @return LambdaQueryWrapper 的包装类
     */
    public LambdaQueryChainWrapper<T> lambdaQuery() {
        return ChainWrappers.lambdaQueryChain(getBaseMapper());
    }

    /**
     * 链式查询 lambda 式
     * kotlin 使用
     *
     * @return KtQueryWrapper 的包装类
     */
    public KtQueryChainWrapper<T> ktQuery() {
        return ChainWrappers.ktQueryChain(getBaseMapper(), getEntityClass());
    }

    /**
     * 链式查询 lambda 式
     * kotlin 使用
     *
     * @return KtQueryWrapper 的包装类
     */
    public KtUpdateChainWrapper<T> ktUpdate() {
        return ChainWrappers.ktUpdateChain(getBaseMapper(), getEntityClass());
    }

    /**
     * 链式更改 普通
     *
     * @return UpdateWrapper 的包装类
     */
    public UpdateChainWrapper<T> update() {
        return ChainWrappers.updateChain(getBaseMapper());
    }

    /**
     * 链式更改 lambda 式
     * <p>注意：不支持 Kotlin </p>
     *
     * @return LambdaUpdateWrapper 的包装类
     */
    public LambdaUpdateChainWrapper<T> lambdaUpdate() {
        return ChainWrappers.lambdaUpdateChain(getBaseMapper());
    }



    /**
     * 获取mapperStatementId
     *
     * @param sqlMethod 方法名
     * @return 命名id
     * @since 3.4.0
     */
    protected String getSqlStatement(SqlMethod sqlMethod) {
        return SqlHelper.getSqlStatement(currentMapperClass(), sqlMethod);
    }


    /**
     * 保存
     */
    public T save(T t){
        baseMapper.insert(t);
        return t;
    }

    /**
     * 批量保存
     */
    @Transactional(rollbackFor = Exception.class)
    public List<T> saveAll(List<T> list){
        saveBatch(list, DEFAULT_BATCH_SIZE);
        return list;
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean saveBatch(Collection<T> entityList, int batchSize) {
        String sqlStatement = getSqlStatement(SqlMethod.INSERT_ONE);
        return executeBatch(entityList, batchSize, (sqlSession, entity) -> sqlSession.insert(sqlStatement, entity));
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean updateAllById(Collection<T> entityList) {
        return updateBatchById(entityList, DEFAULT_BATCH_SIZE);
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean updateBatchById(Collection<T> entityList, int batchSize) {
        String sqlStatement = getSqlStatement(SqlMethod.UPDATE_BY_ID);
        return executeBatch(entityList, batchSize, (sqlSession, entity) -> {
            MapperMethod.ParamMap<T> param = new MapperMethod.ParamMap<>();
            param.put(Constants.ENTITY, entity);
            sqlSession.update(sqlStatement, param);
        });
    }

    /**
     * 执行批量操作
     *
     * @param list      数据集合
     * @param batchSize 批量大小
     * @param consumer  执行方法
     * @param <E>       泛型
     * @return 操作结果
     * @since 3.3.1
     */
    protected <E> boolean executeBatch(Collection<E> list, int batchSize, BiConsumer<SqlSession, E> consumer) {
        return SqlHelper.executeBatch(currentModelClass(), log, list, batchSize, consumer);
    }


    /**
     * TableId 注解存在更新记录，否插入一条记录
     *
     * @param entity 实体对象
     * @return boolean
     */
    @Transactional(rollbackFor = Exception.class)
    public T saveOrUpdate(T entity) {
        if (null != entity) {
            TableInfo tableInfo = TableInfoHelper.getTableInfo(getEntityClass());
            Assert.notNull(tableInfo, "错误:无法执行.因为找不到实体的 TableInfo 缓存!");
            String keyProperty = tableInfo.getKeyProperty();
            Assert.notEmpty(keyProperty, "错误:无法执行.因为无法从实体中找到主键的列!");
            Object idVal = ReflectionKit.getFieldValue(entity, tableInfo.getKeyProperty());
            if (StringUtils.checkValNull(idVal) || Objects.isNull(findById((Serializable) idVal))){
                save(entity);
            } else{
                updateById(entity);
            }
        }
        return entity;
    }

    /**
     * 根据id进行更新
     */
    public T updateById(T t){
        baseMapper.updateById(t);
        return t;
    }

    /**
     * 根据指定字段进行更新
     */
    public T updateByField(T t,SFunction<T, ?> field, Object fieldValue){
        lambdaUpdate()
                .eq(field,fieldValue)
                .update(t);
        return t;
    }

    /**
     * 查询全部
     */
    public List<T> findAll(){
        return lambdaQuery().list();
    }

    /**
     * 根据主键查询
     */
    public Optional<T> findById(Serializable id){
        return Optional.ofNullable(baseMapper.selectById(id));
    }

    /**
     * 根据字段查询唯一值
     * @param field 字段
     * @param fieldValue 字段数据
     * @return 对象
     */
    public Optional<T> findByField(SFunction<T, ?> field, Object fieldValue){
        return Optional.ofNullable(lambdaQuery().eq(field,fieldValue).one());
    }


    /**
     * idList 为空不报错
     * @param idList is集合
     * @return list
     */
    public List<T> findAllByIds(Collection<? extends Serializable> idList){
        if (CollUtil.isEmpty(idList)){
            return new ArrayList<>(0);
        }
        return baseMapper.selectBatchIds(idList);
    }

    /**
     * 根据字段查询列表
     * @param field 字段
     * @param fieldValue 字段数据
     * @return 对象列表
     */
    public List<T> findAllByField(SFunction<T, ?> field, Object fieldValue){
        return lambdaQuery().eq(field,fieldValue).list();
    }

    /**
     * 根据字段集合查询列表
     * @param field 字段
     * @param fieldValues 字段数据集合
     * @return 对象列表
     */
    public List<T> findAllByFields(SFunction<T, ?> field, Collection<? extends Serializable> fieldValues){
        if (CollUtil.isEmpty(fieldValues)){
            return new ArrayList<>(0);
        }
        return lambdaQuery().in(field,fieldValues).list();
    }

    /**
     * 根据指定字段查询是否存在数据
     * @param field 字段
     * @param fieldValue 字段数据
     * @return 是否存在
     */
    public boolean existedByField(SFunction<T, ?> field, Object fieldValue){
        return lambdaQuery().eq(field,fieldValue).exists();
    }

    /**
     * 根据指定字段查询存在的数据数量
     * @param field 字段
     * @param fieldValue 字段数据
     * @return 数量
     */
    public Integer countByField(SFunction<T, ?> field, Object fieldValue){
        return lambdaQuery().eq(field,fieldValue).count();
    }

    /**
     * 根据主键进行删除
     */
    public void deleteById(Serializable id){
        baseMapper.deleteById(id);
    }

    /**
     * 根据主键进行删除
     */
    public void deleteByIds(Collection<? extends Serializable> idList){
        if (CollUtil.isNotEmpty(idList)) {
            baseMapper.deleteBatchIds(idList);
        }
    }

    /**
     * 根据指定字段值进行删除
     * @param field 字段
     * @param fieldValue 字段数据
     * @return boolean
     */
    public boolean deleteByField(SFunction<T, ?> field, Object fieldValue){
        return lambdaUpdate().eq(field,fieldValue).remove();
    }
}
