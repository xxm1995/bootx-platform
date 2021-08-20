package cn.bootx.payment.core.paymodel.wallet.dao;

import cn.bootx.payment.core.paymodel.wallet.entity.Wallet;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Optional;

/**
 * 钱包
 * @author xxm
 * @date 2021/2/24
 */
@Mapper
public interface WalletMapper extends BaseMapper<Wallet> {


    /**
     * 增加余额
     *
     * @param walletId 钱包ID
     * @param amount   增加的额度
     * @param operator 操作人
     * @param date     时间
     * @return 更新数量
     */
    @Update("update pc_wallet set balance = (balance + #{amount}),last_modifier = #{operator},last_modified_time = #{date},version = (version+1) where id = #{walletId}")
    int increaseBalance(@Param("walletId") Long walletId,@Param("amount") BigDecimal amount,@Param("operator") Long operator,@Param("date") LocalDateTime date);

    /**
     * 减少余额
     *
     * @param walletId 钱包ID
     * @param amount   减少的额度
     * @param operator 操作人
     * @param date     操作时间
     * @return 操作条数
     */
    @Update("update pc_wallet set balance = (balance - #{amount}),last_modifier = #{operator},last_modified_time = #{date},version = (version+1) where id = #{walletId} and (balance- #{amount}) >= 0")
    int reduceBalance(@Param("walletId") Long walletId,@Param("amount") BigDecimal amount,@Param("operator") Long operator,@Param("date") LocalDateTime date);

    /**
     * 减少余额,允许扣成负数
     *
     * @param walletId 钱包ID
     * @param amount   减少的额度
     * @param operator 操作人
     * @param date     操作时间
     * @return 操作条数
     */
    @Update("update pc_wallet set balance = (balance - ?2),lastModifier = ?3,lastModifiedTime = ?4,version = (version+1) where id = ?1 and tid = ?5")
    int reduceBalanceUnlimited(Long walletId, BigDecimal amount, Long operator, LocalDateTime date);

    boolean existsByUserIdAndTid(Long userId,Long tid);

    Optional<Wallet> findByUserIdAndTid(Long userId, Long tid);

    Optional<Wallet> findByIdAndTid(Long id, Long tid);
}
