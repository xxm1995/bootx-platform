package cn.bootx.baseapi.core.storage.entity;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
* 文件存储
* @author xxm
* @date 2021/8/6
*/
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("sys_storage_file")
public class StorageFile extends MpBaseEntity {

    /**空间*/
    private String bucketName;
        
    /**文件名*/
    private String fileName;
        
    /**原文件名*/
    private String originalFileName;

    /** 链接 */
    private String url;
        
    /**文件类型*/
    private String type;
        
    /**文件大小*/
    private Long size;
        
}