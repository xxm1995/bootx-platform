package cn.bootx.starter.file.code;

/**
 * 文件上传类型
 *
 * @author xxm
 * @date 2022/1/14
 */
public enum FileUploadTypeEnum {

    /** 本地存储 */
    LOCAL,
    /** Mongo存储 */
    MONGO,
    /** minio存储 */
    MINIO,
    /** 阿里云 oss存储 */
    ALIYUN_OSS

}
