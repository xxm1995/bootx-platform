package cn.bootx.common.log.db;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.AppenderBase;
import cn.bootx.common.core.code.CommonCode;
import com.google.common.collect.Queues;
import lombok.Getter;
import lombok.Setter;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.MDC;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author xxm
 * @date 2023/3/9
 */
@Getter
@Setter
@Slf4j
public class DbAppender extends AppenderBase<ILoggingEvent> {
    private static final ArrayBlockingQueue<LogInfo> queue = Queues.newArrayBlockingQueue(99999);

    /**
     * 注意, 在里面调用异步方法的时候不可以触发打印日志, 否则会死循环
     * 同步方法中触发了日志打印, 不会触发该方法
     *  定时写入到数据库中
     *  使用Mybatis Plus进行分表, 分日/周/月进行保存
     *  设置一个队列, 然后定时从队列中取出日志进行保存
     */
    @Override
    protected void append(ILoggingEvent eventObject) {
        // 接收日志放到队列中
        Instant instant = Instant.ofEpochMilli(eventObject.getTimeStamp());
        ZoneId zone = ZoneId.systemDefault();
        LogInfo logInfo = new LogInfo()
                .setMessage(eventObject.getFormattedMessage())
                .setClassName(eventObject.getThreadName())
                .setLevel(eventObject.getLevel().levelStr)
                .setThreadName(eventObject.getThreadName())
                .setTime(LocalDateTime.ofInstant(instant, zone))
                .setTraceId(MDC.get(CommonCode.TRACE_ID));
        queue.add(logInfo);
    }

    /**
     *
     */
    @SuppressWarnings("UnstableApiUsage")
    @SneakyThrows
    public static List<LogInfo> getLogs(){
        List<LogInfo> list = new ArrayList<>();
        Queues.drain(queue,list,1000,1, TimeUnit.MILLISECONDS);
        return list;
    }
}
