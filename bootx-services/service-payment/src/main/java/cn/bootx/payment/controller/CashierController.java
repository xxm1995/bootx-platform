package cn.bootx.payment.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.payment.param.cashier.CashierSinglePayParam;
import cn.bootx.payment.core.cashier.service.CashierService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
*
* @author xxm
* @date 2022/2/23
*/
@Tag(name = "结算台")
@RestController
@RequestMapping("/cashier")
@RequiredArgsConstructor
public class CashierController {
    private final CashierService cashierService;

    @Operation(summary = "发起支付(单渠道)")
    @PostMapping("/singlePay")
    public ResResult<String> singlePay(@RequestBody CashierSinglePayParam cashierSinglePayParam){
        return Res.ok(cashierService.singlePay(cashierSinglePayParam));
    }
}
