package cn.bootx.starter.audit.log.core.db.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.starter.audit.log.core.db.convert.LogConvert;
import cn.bootx.starter.audit.log.dto.OperateLogDto;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**   
* 操作日志
* @author xxm  
* @date 2021/8/12 
*/
@Data
@Accessors(chain = true)
@TableName("starter_operate_log")
public class OperateLogDb implements EntityBaseFunction<OperateLogDto> {

    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /** 操作模块 */
    private String title;

    /** 操作人员id */
    private Long operateId;

    /** 操作人员账号 */
    private String username;

    /** 业务类型 */
    private String businessType;

    /** 请求方法 */
    private String method;

    /** 请求方式 */
    private String requestMethod;

    /** 请求url */
    private String operateUrl;

    /** 操作ip */
    private String operateIp;

    /** 操作地点 */
    private String operateLocation;

    /** 请求参数 */
    private String operateParam;

    /** 返回参数 */
    private String operateReturn;

    /** 操作状态（0正常 1异常） */
    private boolean success;

    /** 错误消息 */
    private String errorMsg;

    /** 操作时间 */
    private LocalDateTime operateTime;

    @Override
    public OperateLogDto toDto() {
        return LogConvert.CONVERT.convert(this);
    }
}
