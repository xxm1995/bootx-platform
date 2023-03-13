package cn.bootx.common.log.db;

import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 日志
 *
 * @author xxm
 * @date 2023/3/9
 */
@Data
@Accessors(chain = true)
public class LogInfo {

    private String message;

    private String className;

    private String level;

    private String threadName;

    private LocalDateTime time;

    private String traceId;

}
