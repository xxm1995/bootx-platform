package cn.bootx.starter.quartz.code;

/**   
* 定时任务状态
* @author xxm  
* @date 2021/11/2 
*/
public interface QuartzJobCode {

    /** 运行 */
    int RUNNING = 1;

    /** 停止 */
    int STOP = 0;
}
