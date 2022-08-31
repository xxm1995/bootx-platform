package cn.bootx.starter.flowable.core.instance.convert;

import cn.bootx.starter.flowable.dto.instance.ActivityInstanceChart;
import org.flowable.engine.history.HistoricActivityInstance;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**   
 * 流程活动转换
 * @author xxm  
 * @date 2022/8/31 
 */
@Mapper
public interface BpmActivityConvert {
    BpmActivityConvert CONVERT = Mappers.getMapper(BpmActivityConvert.class);


    List<ActivityInstanceChart> convert(List<HistoricActivityInstance> in);

    ActivityInstanceChart convert(HistoricActivityInstance in);
}
