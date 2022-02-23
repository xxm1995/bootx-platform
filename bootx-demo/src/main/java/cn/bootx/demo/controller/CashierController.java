package cn.bootx.demo.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.demo.core.cashier.entity.CashierPay;
import cn.bootx.demo.core.cashier.service.CashierService;
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
@Tag(name = "结算台演示")
@RestController
@RequestMapping("/demo/cashier")
@RequiredArgsConstructor
public class CashierController {
    private final CashierService cashierService;

    @Operation(summary = "发起支付")
    @PostMapping("/pay")
    public ResResult<String> pay(@RequestBody CashierPay cashierPay){
        return Res.ok(cashierService.pay(cashierPay));
    }
}
