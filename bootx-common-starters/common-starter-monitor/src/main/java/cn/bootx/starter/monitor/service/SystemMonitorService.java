package cn.bootx.starter.monitor.service;

import cn.bootx.starter.monitor.entity.SystemMonitorResult;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.system.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.DecimalFormat;

/**
*
* @author xxm
* @date 2022/6/10
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class SystemMonitorService {


    /**
     * 获取系统信息
     */
    public SystemMonitorResult getSystemInfo(){
        //系统属性结果集
        SystemMonitorResult result = new SystemMonitorResult();
        JvmInfo jvmInfo = SystemUtil.getJvmInfo();
        JavaRuntimeInfo javaRuntimeInfo = SystemUtil.getJavaRuntimeInfo();
        OsInfo osInfo = SystemUtil.getOsInfo();
        HostInfo hostInfo = SystemUtil.getHostInfo();
        RuntimeInfo runtimeInfo = SystemUtil.getRuntimeInfo();

        // 系统信息
        SystemMonitorResult.SysOsInfo sysOsInfo = new SystemMonitorResult.SysOsInfo();
        sysOsInfo.setOsName(osInfo.getName());
        sysOsInfo.setOsArch(osInfo.getArch());
        sysOsInfo.setOsVersion(osInfo.getVersion());
        sysOsInfo.setOsHostName(hostInfo.getName());
        sysOsInfo.setOsHostAddress(hostInfo.getAddress());
        result.setSysOsInfo(sysOsInfo);

        // Java信息
        SystemMonitorResult.SysJavaInfo sysJavaInfo = new SystemMonitorResult.SysJavaInfo();
        sysJavaInfo.setJvmName(jvmInfo.getName());
        sysJavaInfo.setJvmVersion(jvmInfo.getVersion());
        sysJavaInfo.setJvmVendor(jvmInfo.getVendor());
        sysJavaInfo.setJavaName(javaRuntimeInfo.getName());
        sysJavaInfo.setJavaVersion(javaRuntimeInfo.getVersion());
        result.setSysJavaInfo(sysJavaInfo);

        // jvm内存信息
        SystemMonitorResult.SysJvmMemInfo sysJvmMemInfo = new SystemMonitorResult.SysJvmMemInfo();
        sysJvmMemInfo.setJvmMaxMemory(FileUtil.readableFileSize(runtimeInfo.getMaxMemory()));
        sysJvmMemInfo.setJvmUsableMemory(FileUtil.readableFileSize(runtimeInfo.getUsableMemory()));
        sysJvmMemInfo.setJvmTotalMemory(FileUtil.readableFileSize(runtimeInfo.getTotalMemory()));
        sysJvmMemInfo.setJvmFreeMemory(FileUtil.readableFileSize(runtimeInfo.getFreeMemory()));
        BigDecimal usedMemory = NumberUtil.sub(new BigDecimal(runtimeInfo.getTotalMemory()), new BigDecimal(runtimeInfo.getFreeMemory()));
        sysJvmMemInfo.setJvmUsedMemory(FileUtil.readableFileSize(usedMemory.longValue()));
        BigDecimal rate = NumberUtil.div(usedMemory, runtimeInfo.getTotalMemory());
        String usedRate = new DecimalFormat("#.00").format(NumberUtil.mul(rate, 100)) + "%";
        sysJvmMemInfo.setJvmMemoryUsedRate(usedRate);
        result.setSysJvmMemInfo(sysJvmMemInfo);

        return result;
    }
}
