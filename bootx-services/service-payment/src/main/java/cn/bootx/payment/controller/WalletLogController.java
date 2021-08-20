package cn.bootx.payment.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.payment.core.paymodel.wallet.service.WalletLogService;
import cn.bootx.payment.dto.paymodel.wallet.WalletLogDto;
import cn.bootx.payment.param.paymodel.wallet.WalletLogQueryParam;
import io.swagger.annotations.*;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**   
* 钱包日志相关接口
* @author xxm  
* @date 2020/12/8 
*/
@Api(tags = "钱包日志相关的接口")
@RestController
@RequestMapping("/walletLog")
@AllArgsConstructor
public class WalletLogController {

    private final WalletLogService walletLogService;


    @ApiOperation("查询钱包日志")
    @PostMapping("/search")
    public ResResult<List<WalletLogDto>> searchLog(@RequestBody WalletLogQueryParam walletLogQueryParam) {
        return Res.ok(walletLogService.queryLog(walletLogQueryParam));
    }

    @ApiOperation("查询钱包日志")
    @ApiResponses(value = {
            @ApiResponse(code = 0, message = "操作成功")
    })
    @PostMapping("/search/condition")
    public ResResult<List<WalletLogDto>> searchByCondition(@RequestBody WalletLogQueryParam walletLogQueryParam) {
        return Res.ok();
    }

    @ApiOperation("查询钱包日志(分页)")
    @PostMapping("/search/page")
    public ResResult<List<WalletLogDto>> searchLog(@ApiParam("页码 默认为0") @RequestParam(value = "pageNo", required = false, defaultValue = "0") int pageNo,
                                                            @ApiParam("每页展示条数 默认为1") @RequestParam(value = "pageSize", required = false, defaultValue = "1") int pageSize,
                                                            @RequestBody WalletLogQueryParam walletLogQueryParam) {
        return Res.ok();

    }
}
