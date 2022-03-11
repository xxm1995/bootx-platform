package cn.bootx.payment.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.payment.core.paymodel.wallet.service.WalletLogService;
import cn.bootx.payment.dto.paymodel.wallet.WalletLogDto;
import cn.bootx.payment.param.paymodel.wallet.WalletLogQueryParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 钱包日志相关接口
 * @author xxm
 * @date 2020/12/8
 */
@Tag(name ="钱包日志相关的接口")
@RestController
@RequestMapping("/walletLog")
@AllArgsConstructor
public class WalletLogController {
    private final WalletLogService walletLogService;


    @Operation(summary = "个人钱包日志")
    @PostMapping("/pageByPersonal")
    public ResResult<PageResult<WalletLogDto>> pageByPersonal(@ParameterObject PageParam pageParam,@ParameterObject WalletLogQueryParam param){
        return Res.ok(walletLogService.pageByPersonal(pageParam,param));
    }
    
    @Operation(summary = "查询钱包日志(分页)")
    @GetMapping("/page")
    public ResResult<PageResult<WalletLogDto>> page(@ParameterObject PageParam pageParam,@ParameterObject WalletLogQueryParam param) {
        return Res.ok(walletLogService.page(pageParam,param));
    }
}
