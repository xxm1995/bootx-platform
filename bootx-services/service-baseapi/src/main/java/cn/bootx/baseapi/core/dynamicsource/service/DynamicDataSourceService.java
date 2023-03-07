package cn.bootx.baseapi.core.dynamicsource.service;

import cn.bootx.baseapi.core.dynamicsource.dao.DynamicDataSourceManager;
import cn.bootx.baseapi.core.dynamicsource.entity.DynamicDataSource;
import cn.bootx.baseapi.dto.dynamicsource.DynamicDataSourceDto;
import cn.bootx.baseapi.param.dynamicsource.DynamicDataSourceParam;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.db.Entity;
import cn.hutool.db.ds.simple.SimpleDataSource;
import cn.hutool.db.handler.EntityHandler;
import cn.hutool.db.sql.SqlExecutor;
import com.baomidou.dynamic.datasource.DynamicRoutingDataSource;
import com.baomidou.dynamic.datasource.creator.DataSourceCreator;
import com.baomidou.dynamic.datasource.spring.boot.autoconfigure.DataSourceProperty;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.Connection;
import java.util.List;

/**
 * 动态数据源管理
 * @author xxm
 * @date 2022/9/24
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class DynamicDataSourceService {
    private final DynamicDataSourceManager dynamicDataSourceManager;

    private final DataSourceCreator hikariDataSourceCreator;
    private final DynamicRoutingDataSource dynamicRoutingDataSource;


    /**
     * 添加
     */
    public void add(DynamicDataSourceParam param){
        DynamicDataSource dynamicDataSource = DynamicDataSource.init(param);
        dynamicDataSourceManager.save(dynamicDataSource);
    }

    /**
     * 修改
     */
    public void update(DynamicDataSourceParam param){
        DynamicDataSource dynamicDataSource = dynamicDataSourceManager.findById(param.getId()).orElseThrow(DataNotExistException::new);

        BeanUtil.copyProperties(param,dynamicDataSource, CopyOptions.create().ignoreNullValue());
        dynamicDataSourceManager.updateById(dynamicDataSource);
    }

    /**
     * 分页
     */
    public PageResult<DynamicDataSourceDto> page(PageParam pageParam, DynamicDataSourceParam dynamicDataSourceParam){
        return MpUtil.convert2DtoPageResult(dynamicDataSourceManager.page(pageParam,dynamicDataSourceParam));
    }

    /**
     * 获取单条
     */
    public DynamicDataSourceDto findById(Long id){
        return dynamicDataSourceManager.findById(id).map(DynamicDataSource::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取全部
     */
    public List<DynamicDataSourceDto> findAll(){
        return ResultConvertUtil.dtoListConvert(dynamicDataSourceManager.findAll());
    }

    /**
     * 测试连接
     */
    public String testConnection(DynamicDataSourceParam param){
        try(
                SimpleDataSource ds = new SimpleDataSource(param.getDbUrl(), param.getDbUsername(), param.getDbPassword(),param.getDbDriver());
                Connection connection = ds.getConnection();
        ) {
            Entity query = SqlExecutor.query(connection, "SELECT 1", new EntityHandler());
        } catch (Exception e) {
            return e.getMessage();
        }
        return null;
    }

    /**
     * 删除
     */
    public void delete(Long id){
        dynamicDataSourceManager.deleteById(id);
    }

    /**
     * 添加数据源到多数据集合中
     */
    private void addDynamicDataSource(DynamicDataSource dynamicDataSource, String dbPassword) {
        DataSourceProperty dataSourceProperty = new DataSourceProperty();
        dataSourceProperty.setUrl(dynamicDataSource.getDbUrl());
        dataSourceProperty.setPassword(dbPassword);
        dataSourceProperty.setDriverClassName(dynamicDataSource.getDbDriver());
        dataSourceProperty.setUsername(dynamicDataSource.getDbUsername());
        DataSource dataSource = hikariDataSourceCreator.createDataSource(dataSourceProperty);
        try {
            dynamicRoutingDataSource.addDataSource(dynamicDataSource.getCode(), dataSource);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



}
