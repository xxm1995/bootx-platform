package cn.bootx.baseapi.dto.log;

import cn.bootx.common.core.rest.dto.BaseDto;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**   
* 操作日志
* @author xxm  
* @date 2021/8/12 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
public class OperateLogDto extends BaseDto {

    /** 操作模块 */
    private String title;

    /** 业务类型0=其它,1=新增,2=修改,3=删除,4=授权,5=导出,6=导入,7=强退,8=生成代码,9=清空数据 */
    private Integer businessType;

    /** 请求方法 */
    private String method;

    /** 请求方式 */
    private String requestMethod;

    /** 操作类别（0其它 1后台用户 2手机端用户） */
    private Integer operateType;

    /** 操作人员 */
    private String operateName;

    /** 部门名称 */
    private String deptName;

    /** 请求url */
    private String operateUrl;

    /** 操作地址 */
    private String operateIp;

    /** 操作地点 */
    private String operateLocation;

    /** 请求参数 */
    private String operateParam;

    /** 返回参数 */
    private String jsonResult;

    /** 操作状态（0正常 1异常） */
    private Integer status;

    /** 错误消息 */
    private String errorMsg;

    /** 操作时间 */
    private LocalDateTime operateTime;
}
