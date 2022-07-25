package cn.bootx.common.core.util;

import lombok.SneakyThrows;
import lombok.experimental.UtilityClass;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;

/**   
 * 文件配置
 * @author xxm  
 * @date 2022/7/25 
 */
@UtilityClass
public class FileUtil extends cn.hutool.core.io.FileUtil {

    /**
     * 创建临时文件.
     *
     * @param inputStream 输入文件流
     * @param name        文件名
     * @param ext         扩展名
     */
    @SneakyThrows
    public static File createTempFile(InputStream inputStream, String name, String ext){
        return createTmpFile(inputStream, name, ext, Files.createTempDirectory("temp").toFile());
    }

    /**
     * 创建临时文件.
     *
     * @param inputStream 输入文件流
     * @param name        文件名
     * @param ext         扩展名
     * @param tmpDirFile  临时文件夹目录
     */
    @SneakyThrows
    public File createTmpFile(InputStream inputStream, String name, String ext, File tmpDirFile){
        File resultFile = File.createTempFile(name, '.' + ext, tmpDirFile);
        resultFile.deleteOnExit();
        writeFromStream(inputStream, resultFile);
        return resultFile;
    }
}
