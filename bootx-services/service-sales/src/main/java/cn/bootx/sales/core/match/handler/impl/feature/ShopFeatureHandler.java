package cn.bootx.sales.core.match.handler.impl.feature;

import cn.bootx.sales.core.match.handler.func.FeatureHandler;
import cn.bootx.sales.param.order.OrderDetailCheckParam;
import org.springframework.stereotype.Component;

/**
* 商店id提取
* @author xxm
* @date 2021/5/18
*/
@Component
public class ShopFeatureHandler implements FeatureHandler {

    @Override
    public String getFeatureType() {
        return "shopId";
    }

    @Override
    public String getFeaturePoint(OrderDetailCheckParam checkParam) {
        return String.valueOf(checkParam.getShopId());
    }
}
