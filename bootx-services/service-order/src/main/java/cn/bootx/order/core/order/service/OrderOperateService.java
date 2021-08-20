package cn.bootx.order.core.order.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.order.code.OrderStatusCode;
import cn.bootx.order.core.order.dao.OrderDetailManager;
import cn.bootx.order.core.order.dao.OrderManager;
import cn.bootx.order.core.order.dao.OrderStrategyMappingManager;
import cn.bootx.order.core.order.entity.Order;
import cn.bootx.order.core.order.entity.OrderDetail;
import cn.bootx.order.core.order.entity.OrderStrategyMapping;
import cn.bootx.order.core.order.factory.OrderFactory;
import cn.bootx.order.dto.order.OrderDto;
import cn.bootx.order.param.order.OrderParam;
import cn.bootx.order.param.order.OrderWholeParam;
import cn.bootx.sales.core.calculate.service.OrderPreviewService;
import cn.bootx.sales.core.coupon.service.CouponService;
import cn.bootx.sales.dto.coupon.CouponDto;
import cn.bootx.sales.dto.order.OrderPreviewResult;
import cn.bootx.sales.param.order.OrderCheckParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 订单构建操作类
 * @author xxm
 * @date 2020/10/12
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class OrderOperateService {
    private final OrderManager orderManager;
    private final OrderDetailManager orderDetailManager;
    private final OrderStrategyMappingManager orderStrategyMappingManager;

    private final CouponService couponService;
    private final OrderPreviewService orderPreviewService;

    private final OrderFactory orderFactory;

    /**
     * 传入订单和优惠, 下单
     */
    @Transactional(rollbackFor = Exception.class)
    public OrderDto placeOrder(OrderWholeParam orderWholeParam){

        OrderParam orderParam = orderWholeParam.getOrderParam();
        OrderCheckParam orderCheckParam = this.buildCheckOrder(orderParam);

        // 计算价格
        OrderPreviewResult orderCheck = orderPreviewService.previewOrderPrice(orderCheckParam);

        // 转换成订单对象
        Order order = orderFactory.buildOrder(orderCheck,orderWholeParam.getOrderParam());
        order.setAddressInfo(orderWholeParam.getOrderAddressInfo());
        order.setInvoiceInfo(orderWholeParam.getOrderInvoiceInfo());

        // 锁定优惠券
        if (CollUtil.isNotEmpty(orderCheck.getCoupons())){
            List<Long> couponIds = orderCheck.getCoupons().stream().map(CouponDto::getId).collect(Collectors.toList());
            couponService.lockByIds(couponIds);
        }

        // 订单持久化
        this.orderInfoPersistence(order);
        // 发布订单创建成功事件

        return order.toDto();
    }

    /**
     * 持久化
     */
    private void orderInfoPersistence(Order order){
        order.setStatus(OrderStatusCode.STATUS_NORMAL);

        // 保存订单
        orderManager.save(order);
        // 保存明细
        orderDetailManager.saveAll(order.getOrderDetails());

        List<OrderStrategyMapping> orderStrategyMappings = order.getOrderDetails()
                .stream()
                .map(OrderDetail::getMappings)
                .flatMap(Collection::stream)
                .collect(Collectors.toList());
        // 保存策略映射
        orderStrategyMappingManager.saveAll(orderStrategyMappings);
    }

    /**
     * 付款成功状态变更
     */
    public void paidOrderState(Long orderId) {
        Order order = orderManager.findById(orderId).orElseThrow(() -> new BizException("订单未查到"));
        if (!Objects.equals(order.getStatus(), OrderStatusCode.STATUS_NORMAL)) {
            throw new BizException("不可以操作的状态");
        }

        order.setStatus(OrderStatusCode.STATUS_NOT_YET_SHIPPED)
                .setPayTime(LocalDateTime.now());
        orderManager.updateById(order);

        // 使用优惠券
        String couponIds = order.getCouponIds();
        if (StrUtil.isNotBlank(couponIds)) {
            List<Long> ids = StrUtil.split(couponIds, ",").stream()
                    .map(Long::new)
                    .collect(Collectors.toList());
//            couponClient.useBatch(ids,orderId);
        }
    }

    /**
     * 转化成销售中心所需参数
     */
    private OrderCheckParam buildCheckOrder(OrderParam orderParam){
        OrderCheckParam orderCheckParam = new OrderCheckParam();
        BeanUtil.copyProperties(orderParam,orderCheckParam);
        return orderCheckParam;
    }

    /**
     * 取消订单
     */
    public void cancelOrderState(Long orderId) {
        Order order = orderManager.findById(orderId).orElseThrow(() -> new BizException("订单未查到"));
        order.setStatus(OrderStatusCode.STATUS_CANCEL);
//        throw new BizException("回滚测试");
        orderManager.updateById(order);
    }
}
