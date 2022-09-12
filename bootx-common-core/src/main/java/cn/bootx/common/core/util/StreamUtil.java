package cn.bootx.common.core.util;

import lombok.experimental.UtilityClass;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;

/**   
* 流工具类
* @author xxm  
* @date 2021/12/5 
*/
@UtilityClass
public class StreamUtil {

    public static final int BUFFER_SIZE = 4096;

    /**
     * 复制流到字符串
     * @param in 输入流
     * @param charset 字符集
     */
    public String copyToString(InputStream in, Charset charset) throws IOException {
        if (in == null) {
            return "";
        }

        StringBuilder out = new StringBuilder();
        InputStreamReader reader = new InputStreamReader(in, charset);
        char[] buffer = new char[BUFFER_SIZE];
        int bytesRead;
        while ((bytesRead = reader.read(buffer)) != -1) {
            out.append(buffer, 0, bytesRead);
        }
        return out.toString();
    }
}
