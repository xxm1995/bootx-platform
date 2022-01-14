package cn.bootx.starter.file.code;

/**
* 上传类型
* @author xxm
* @date 2022/1/14
*/
public interface FileUploadTypeCode {

    /** 本地存储 */
    int LOCAL = 1;

    /** Mongo存储 */
    int MONGO = 2;

    /** minio存储 */
    int MINIO = 3;

    /** 阿里云 oss存储 */
    int ALIYUN_OSS = 4;
}
