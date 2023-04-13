package cn.bootx.starter.audit.log.ip2region;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.starter.audit.log.properties.AuditLogProperties;
import cn.hutool.core.lang.PatternPool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.lionsoul.ip2region.xdb.Searcher;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Objects;
import java.util.regex.Matcher;

/**
 *
 * @author xxm
 * @date 2023/4/13
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class IpToRegionService {
    /** VectorIndex 缓存 */
    private static  byte[] XDB_INDEX;
    /** 整个 xdb 文件缓存 */
    private static  byte[] XDB_BUFF;

    private final AuditLogProperties auditLogProperties;

    /**
     * 获取文件查询方式
     */
    private Searcher getSearcherByFile(){
        try {
            return Searcher.newWithFileOnly(auditLogProperties.getIp2region().getFilePath());
        } catch (IOException e) {
            return null;
        }
    }

    /**
     * VectorIndex 索引
     */
    private Searcher getSearcherByIndex(){
        try {
            String filePath = auditLogProperties.getIp2region()
                    .getFilePath();
            if (Objects.isNull(XDB_INDEX)) {
                XDB_INDEX = Searcher.loadVectorIndexFromFile(filePath);
            }
            return Searcher.newWithVectorIndex(filePath, XDB_INDEX);
        } catch (IOException e) {
            return null;
        }
    }

    /**
     * 缓存整个 xdb 数据
     */
    private Searcher getSearcherByCache(){
        try {
            if (Objects.isNull(XDB_BUFF)) {
                String filePath = auditLogProperties.getIp2region()
                        .getFilePath();
                XDB_BUFF = Searcher.loadContentFromFile(filePath);
            }
            return Searcher.newWithBuffer(XDB_BUFF);
        } catch (IOException e) {
            return null;
        }
    }

    /**
     * 根据IP获得地址信息
     */
    public IpRegion getRegionByIp(String ip){
        // 判断IP是否合法
        Matcher matcher = PatternPool.IPV4.matcher(ip);
        if (!matcher.matches()) {
            throw new BizException("IP非法");
        }

        // 根据类型获取 Searcher 对象
        Searcher searcher;
        switch (auditLogProperties.getIp2region()
                .getSearchType()) {
            case FILE:
                searcher = getSearcherByFile();
                break;
            case VECTOR_INDEX:
                searcher = getSearcherByIndex();
                break;
            case CACHE:
                searcher = getSearcherByCache();
                break;
            default:
                throw new BizException("IP地址查询方式不合法");
        }
        // 无法进行查询
        if (Objects.isNull(searcher)){
            return null;
        }

        try {

            String search = searcher.search(ip);
            return new IpRegion();
        } catch (Exception e) {
            throw new BizException("IP查询失败");
        } finally {
            try {
                searcher.close();
            } catch (IOException e) {
                throw new BizException("IP查询器关闭失败");
            }
        }
    }
}
