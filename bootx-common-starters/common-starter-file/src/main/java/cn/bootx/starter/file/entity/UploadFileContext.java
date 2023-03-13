package cn.bootx.starter.file.entity;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 上传文件上下文
 *
 * @author xxm
 * @date 2022/1/20
 */
@Data
@Accessors(chain = true)
public class UploadFileContext {

    /** 文件id */
    private Long fileId;

    /** 文件名称 */
    private String fileName;

    /** 文件后缀名 */
    private String fileSuffix;

}
