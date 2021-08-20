package cn.bootx.goods.code;

/**   
* 错误码定义类
* @author xxm  
* @date 2020/11/20 
*/
public interface GoodsErrorCode {


    /** 类目已存在 */
    int CATEGORY_ALREADY_EXISTED = 22010;
    /** 类目属性定义已存在 */
    int CATEGORY_ATTR_DEF_ALREADY_EXISTED = 22011;
    /** 类目不存在 */
    int CATEGORY_NOT_EXISTED = 22012;
    /** 类目属性是系统自定义商品公用属性 */
    int CATEGORY_DEF_NOT_ALLOWED = 22014;
    /** 类目名称支持字母数组和下划线 */
    int CATEGORY_LEF_NAME = 22015;
    /** 类目属性名称支持字母数组和下划线 */
    int CATEGORY_DEF_NAME = 22016;
    /** 类目属性数据库字段同步失败 */
    int CATEGORY_DEF_DDL = 22017;

    /** 商品已存在 */
    int GOODS_ALREADY_EXISTED = 22020;
    /** SKU不存在 */
    int GOODS_NOT_EXISTED = 22021;
    /** 必填字段丢失 */
    int REQUIRED_FIELD_MISS = 22025;


    /** SKU不存在 */
    int GOODS_SKU_NOT_EXISTED = 22021;
    /** 商品SKU已停售 */
    int GOODS_SKU_ALREADY_OFF = 22022;
    /** 商品SKU尚未开售 */
    int GOODS_SKU_NOT_ON = 22023;

    /** 库存不足 */
    int INVENTORY_INSUFFICIENT = 22030;
    /** 预占的库存不足 */
    int INVENTORY_LOCK_INSUFFICIENT = 22031;
    /** 未找到对应的库存 */
    int INVENTORY_NOT_FOUND = 22032;
    /** 更新 sku 时状态错误 */
    int GOODS_SKU_UPDATE_STATE = 22033;
    /** 更新 sku 时价格错误 */
    int GOODS_SKU_UPDATE_PRICE = 22034;
    /** 更新 sku 库存信息错误 */
    int GOODS_SKU_UPDATE_STOCK = 22035;

    /** 更新 sku 库存信息错误 */
    int GOODS_SKU_TIME_FORMAT_ERROR = 22036;

    /** 推送 更新 sku时,延迟设置异常 */
    int GOODS_SKU_DELAY_STRATEGY_EXCEPTION = 22037;

    /** 根据sku价格类型创建表失败 */
    int GOODS_SKU_PRICE_TYPE_DEF_DDL = 22038;
    /** 名称支持字母数字和下划线 */
    int GOODS_SKU_PRICE_TYPE_LEF_NAME = 22039;
    /** sku价格类型已存在 */
    int GOODS_SKU_PRICE_TYPE_ALREADY_EXISTED = 22040;

    /** 名称只支持字母数字和下划线 */
    int COMMON_INVALID_NAME = 22060;
    /** name已存在 */
    int COMMON_NAME_ALREADY_EXISTED = 22061;
    /** 价格类型数据不存在 */
    int COMMON_DATA_NOT_EXIST = 22062;
    /** 库存 token 已过期 */
    int TOKEN_OUT_OF_DADE = 22063;
}
