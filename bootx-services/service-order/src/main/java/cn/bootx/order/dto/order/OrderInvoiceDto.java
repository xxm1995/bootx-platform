package cn.bootx.order.dto.order;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * 订单发票信息
 * @author xxm
 * @date 2021/1/31 
 */
@Data
@Accessors(chain = true)
@ApiModel("订单发票信息")
public class OrderInvoiceDto {

    /** 发票id */
    private Integer invoiceId;

    /** 用户增值税发票id */
    private Integer userInvoiceId;

    /** 税号 */
    private String contact;

    /** 开户行名称 */
    private String bankName;

    /** 开户行账号 */
    private String bankNo;

    /** 详细地址 */
    private String registerAddress;

    /** 手机号 */
    private String invoicePhone;

    /** 发票抬头 */
    private String invoiceTitle;

    /** 发票类型 0普通发票1电子发票2增值税发票 */
    private Integer invoiceType;

    /** 发票类型名称 0普通发票1电子发票2增值税发票 */
    private String invoiceTypeName;

    /** 发票内容 */
    private String invoiceDesc;

    /** 开票时间 */
    private Date addTime;

    /** 发票状态 */
    private Integer status;

    /** 公司名称 */
    private String companyName;

}
