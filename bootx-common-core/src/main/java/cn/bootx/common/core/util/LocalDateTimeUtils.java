package cn.bootx.common.core.util;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;

/**
 * java8 时间工具类
 * @author xxm
 * @date 2020/11/10
 */
public class LocalDateTimeUtils {

    /**
     * 是否在指定的时间范围内
     */
    public static boolean between(LocalDateTime now, LocalDateTime start, LocalDateTime end) {
        return ge(now,start)&&le(now,end);
    }

    /**
     * 大于
     */
    public static boolean gt(LocalDateTime now, LocalDateTime next) {
        long mills = now.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
        long epochMilli = next.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
        return mills > epochMilli;
    }

    /**
     * 小于
     */
    public static boolean lt(LocalDateTime now, LocalDateTime next) {
        long mills = now.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
        long epochMilli = next.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
        return mills < epochMilli;
    }

    /**
     * 大于等于
     */
    public static boolean ge(LocalDateTime now, LocalDateTime next) {
        long mills = now.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
        long epochMilli = next.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
        return mills >= epochMilli;
    }

    /**
     * 小于等于
     */
    public static boolean le(LocalDateTime now, LocalDateTime next) {
        long mills = now.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
        long epochMilli = next.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
        return mills <= epochMilli;
    }

    /**
     * 将localDate转换成localDateTime
     */
    public static LocalDateTime date2DateTime(LocalDate localDate){
        return localDate.atTime(0,0);

    }

    /**
     * 将long类型的timestamp转为LocalDateTime
     * @param timestamp 时间戳
     * @return LocalDateTime
     */
    public static LocalDateTime parse(long timestamp) {
        Instant instant = Instant.ofEpochMilli(timestamp);
        ZoneId zone = ZoneId.systemDefault();
        return LocalDateTime.ofInstant(instant, zone);
    }
    /**
     * LocalDateTime转为long类型的timestamp
     * @param localDateTime 日期时间
     * @return timestamp
     */
    public static long timestamp(LocalDateTime localDateTime) {
        ZoneId zone = ZoneId.systemDefault();
        Instant instant = localDateTime.atZone(zone).toInstant();
        return instant.toEpochMilli();
    }
}

