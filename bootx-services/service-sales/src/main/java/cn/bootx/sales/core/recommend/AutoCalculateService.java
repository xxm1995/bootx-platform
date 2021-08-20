package cn.bootx.sales.core.recommend;//package cn.bootx.sales.core.recommend;
//
//import cn.bootx.common.util.BigDecimalUtil;
//import cn.bootx.sales.core.activity.entity.Activity;
//import cn.bootx.sales.core.calculate.cache.CalculateCache;
//import cn.bootx.sales.core.calculate.cache.OrderCache;
//import cn.bootx.sales.core.calculate.cache.OrderDetailCache;
//import cn.bootx.sales.core.calculate.factory.CalculateFactory;
//import cn.bootx.sales.core.calculate.service.CalculateService;
//import cn.bootx.sales.core.calculate.service.OrderCalculateService;
//import cn.bootx.sales.core.match.injector.MatchRuleInjector;
//import cn.bootx.sales.core.check.service.activity.ActivityCalculateCheckService;
//import cn.bootx.sales.dto.activity.ActivityDto;
//import cn.bootx.sales.dto.order.OrderPreviewResult;
//import cn.bootx.sales.param.order.OrderCheckParam;
//import cn.bootx.sales.param.order.OrderDetailCheckParam;
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.stereotype.Service;
//
//import java.math.BigDecimal;
//import java.util.List;
//import java.util.Map;
//import java.util.stream.Collectors;
//
///**
// * 订单优惠券和策略匹配和计算(自动应用策略,实验性质)
// * @author xxm
// * @date 2020/10/25
// */
//@Slf4j
//@Service
//@RequiredArgsConstructor
//public class AutoCalculateService {
//
//    private final MatchRuleInjector matchRuleInjector;
//    private final CalculateService calculateService;
//    private final ActivityCalculateCheckService activityCalculateCheckService;
//    private final OrderCalculateService orderCalculateService;
//    private final CalculateFactory orderFactory;
//
//
//    /**
//     * 自动匹配策略并计算价格
//     */
//    public OrderPreviewResult previewOrderPriceByAuto(OrderCheckParam orderParam){
//        List<OrderDetailCheckParam> details = orderParam.getDetails();
//
//        List<Long> skuIds = details.stream().map(OrderDetailCheckParam::getSkuId).collect(Collectors.toList());
//        List<Long> goodsIds = details.stream().map(OrderDetailCheckParam::getGoodsId).collect(Collectors.toList());
//        List<Long> categoryIds = details.stream().map(OrderDetailCheckParam::getCategoryId).collect(Collectors.toList());
//        List<Long> shopIds = details.stream().map(OrderDetailCheckParam::getShopId).collect(Collectors.toList());
//
//        // 构建订单
//        CalculateFactory.OrderAndBuffer orderAndBuffer = orderFactory.buildOrderDto(orderParam);
//        OrderCache orderDto = orderAndBuffer.getOrderCache();
//        CalculateCache calculateCache = orderAndBuffer.getCalculateCache();
//
//        // 匹配策略
//        this.chooseActivityByAuto(orderDto,calculateCache);
//
//        // 计算价格
//        return orderCalculateService.calculateOrderPrice(orderDto,calculateCache);
//
//    }
//
//    /**
//     * 自动匹配最优策略
//     */
//    private void chooseActivityByAuto(OrderCache orderDto, CalculateCache calculateCache) {
//        List<OrderDetailCache> details = orderDto.getDetails();
//        // 订单遍历
//        for (OrderDetailCache detail : details) {
//            List<Activity> activities = detail.getActivities();
//            // 求每种策略类型中的最高优惠，相同StrategyId的策略注册只可以使用一个
//            Map<Long, List<ActivityDto>> matchType = activities.stream()
//                    .collect(Collectors.groupingBy(Activity::getStrategyId));
//
//            List<ActivityDto> baseList = matchType.values().stream()
//                    .map(list -> this.getMutex(detail,list,calculateCache))
//                    .collect(Collectors.toList());
//
////            // 分策略类型处理完毕后，处理互斥组冲突策略，保留最优
////            Map<Long, List<ActivityDto>> groupMap = baseList.stream()
////                    .collect(Collectors.groupingBy(ActivityDto::getGroupId));
////
////            // 汇总 (先添加非互斥)
////            List<ActivityDto> collectActivities = baseList.stream()
////                    .filter(o->Objects.isNull(o.getGroupId()))
////                    .collect(Collectors.toList());
////            // 互斥选中最优并添加
////            List<ActivityDto> topActivities = groupMap.values()
////                    .stream()
////                    .map(list -> this.getMutex(detail,list, calculateCache))
////                    .collect(Collectors.toList());
////            collectActivities.addAll(topActivities);
////
////            detail.setActivities(collectActivities)
////                    .setActivityIds(collectActivities.stream()
////                            .map(ActivityDto::getId)
////                            .collect(Collectors.toList()));
//        }
//    }
//
//    /**
//     * 互斥组选明细价格优惠额度最高的
//     */
//    private ActivityDto getMutex(OrderDetailCache detail, List<ActivityDto> list, CalculateCache calculateCache){
//        // 记录最高的优惠
//        ActivityDto activityDto = null;
//        BigDecimal max = BigDecimal.ZERO;
//
//        for (ActivityDto o : list) {
//            BigDecimal amountChange = calculateService.calculateSingle(o, detail,calculateCache);
//            if (BigDecimalUtil.compareTo(amountChange,max)>-1){
//                activityDto = o;
//            }
//        }
//        return activityDto;
//    }
//
//}
