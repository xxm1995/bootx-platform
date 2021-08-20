package cn.bootx.goods.code;

/**
* 商品中心常量
* @author xxm
* @date 2021/3/21
*/
public interface GoodsCode {

    /**
     * 项目名称
     */
    String APPLICATION_NAME = "service-goods-center";
    /**
     * 默认的不受限库存数
     */
    int CAPACITY_UNLIMITED = 99999999;

    /**
     * 库存操作 token 过期时间，30分钟
     */
    long INVENTORY_TOKEN_EXPIRED_TIME = 30 * 60 * 1000L;
}
