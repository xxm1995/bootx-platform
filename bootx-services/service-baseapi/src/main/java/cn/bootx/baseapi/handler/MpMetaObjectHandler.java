package cn.bootx.baseapi.handler;

import cn.bootx.common.core.code.CommonCode;
import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.starter.auth.util.SecurityUtil;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
* mp自动填充值
* @author xxm
* @date 2021/7/27
*/
@Component
public class MpMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        this.strictInsertFill(metaObject, CommonCode.CREATE_TIME, LocalDateTime::now,LocalDateTime.class);
        this.strictInsertFill(metaObject, CommonCode.CREATOR, this::getUserid,Long.class);
        this.strictInsertFill(metaObject, CommonCode.LAST_MODIFIED_TIME, LocalDateTime::now,LocalDateTime.class);
        this.strictInsertFill(metaObject, CommonCode.LAST_MODIFIER, this::getUserid,Long.class);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.strictInsertFill(metaObject, CommonCode.LAST_MODIFIED_TIME, LocalDateTime::now,LocalDateTime.class);
        this.strictInsertFill(metaObject, CommonCode.LAST_MODIFIER, this::getUserid,Long.class);
    }

    public Long getUserid(){
        return SecurityUtil.getCurrentUser()
                .map(UserDetail::getId)
                .orElse(0L);
    }
}
