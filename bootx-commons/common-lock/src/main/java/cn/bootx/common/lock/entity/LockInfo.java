package cn.bootx.common.lock.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * 锁基本信息
 *
 * @author xianzhi.chen@hand-china.com 2019年1月14日下午4:06:52
 */
@Data
@NoArgsConstructor
public class LockInfo {

    private String name;
    private long waitTime;
    private long leaseTime;
    private TimeUnit timeUnit = TimeUnit.SECONDS;
    private List<String> keyList;

    public LockInfo(String name, long waitTime, long leaseTime, TimeUnit timeUnit) {
        this.name = name;
        this.waitTime = waitTime;
        this.leaseTime = leaseTime;
        this.timeUnit = timeUnit;
    }

    public LockInfo(String name, List<String> keyList, long waitTime, long leaseTime, TimeUnit timeUnit) {
        this.name = name;
        this.keyList = keyList;
        this.waitTime = waitTime;
        this.leaseTime = leaseTime;
        this.timeUnit = timeUnit;
    }
}
