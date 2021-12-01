package cn.bootx.payment.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.payment.core.paymodel.wallet.service.WalletService;
import cn.bootx.payment.dto.paymodel.wallet.WalletDto;
import cn.bootx.payment.param.paymodel.wallet.WalletActiveParam;
import cn.bootx.payment.param.paymodel.wallet.WalletRechargeParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

/**
 * 钱包
 * @author xxm
 * @date 2021/2/24
 */
@Tag(name ="钱包相关的接口")
@RestController
@RequestMapping("wallet")
@AllArgsConstructor
public class WalletController {
    private final WalletService walletService;

    @Operation(summary = "开通操作")
    @PostMapping("active")
    public ResResult<WalletDto> activeWallet(@Parameter(name = "开通钱包参数") @RequestBody WalletActiveParam param) {
        return Res.ok(walletService.activeWallet(param));
    }

    @Operation(summary = "充值操作")
    @PostMapping("recharge")
    public ResResult<Void> recharge(@Parameter(name = "充值参数") @RequestBody WalletRechargeParam param) {
        walletService.recharge(param);
        return Res.ok();
    }

    @Operation(summary = "根据钱包ID查询钱包")
    @GetMapping("/getById")
    public ResResult<WalletDto> getWallet(@Parameter(name = "钱包ID", required = true) @NotNull(message = "wallet id cannot be null") @RequestParam("walletId") Long walletId) {
        return Res.ok(walletService.getById(walletId));
    }

    @Operation(summary = "根据用户ID查询钱包")
    @GetMapping("/getByUserId")
    public ResResult<WalletDto> getWalletByUserId(@Parameter(name = "用户ID", required = true) @NotNull(message = "user id cannot be null") @RequestParam("userId") Long userId) {
        return Res.ok(walletService.getByUserId(userId));
    }

}
