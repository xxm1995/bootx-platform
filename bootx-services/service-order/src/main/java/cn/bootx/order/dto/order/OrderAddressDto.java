package cn.bootx.order.dto.order;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* 订单收货地址
* @author xxm
* @date 2021/1/31
*/
@Data
@Accessors(chain = true)
@ApiModel("订单收货地址")
public class OrderAddressDto {

    /** 收货人 */
    private String consignee;

    /** 联系方式 */
    private String contact;

    /** 手机号 */
    private String phone;

    /** 邮政编码 */
    private String postalCode;

    /** 省编号 */
    private Integer provinceId;

    /** 省名称 */
    private String provinceName;

    /** 市编号 */
    private Integer cityId;

    /** 市名称 */
    private String cityName;

    /** 区县编号 */
    private Integer countyId;

    /** 区县名称 */
    private String countyName;

    /** 详细地址 */
    private String street;
}
