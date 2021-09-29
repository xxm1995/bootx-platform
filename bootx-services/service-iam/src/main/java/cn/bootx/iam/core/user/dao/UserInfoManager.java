package cn.bootx.iam.core.user.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.param.user.UserInfoParam;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**   
* 用户信息
* @author xxm  
* @date 2020/4/24 15:32
*/
@Repository
@RequiredArgsConstructor
public class UserInfoManager extends BaseManager<UserInfoMapper,UserInfo> {

    public boolean existsByUsername(String username) {
        return existedByField(UserInfo::getUsername,username);
    }

    public boolean existsByUsername(String username,Long id) {
        return lambdaQuery().eq(UserInfo::getUsername, username)
                .ne(MpBaseEntity::getId,id)
                .exists();
    }

    public boolean existsByEmail(String email) {
        return existedByField(UserInfo::getEmail,email);
    }

    public boolean existsByEmail(String email,Long id) {
        return lambdaQuery().eq(UserInfo::getEmail, email)
                .ne(MpBaseEntity::getId,id)
                .exists();
    }

    public boolean existsByPhone(String phone) {
        return existedByField(UserInfo::getPhone,phone);
    }

    public boolean existsByPhone(String phone,Long id) {
        return lambdaQuery().eq(UserInfo::getPhone, phone)
                .ne(MpBaseEntity::getId,id)
                .exists();
    }

    public Optional<UserInfo> findByUsername(String username) {
        return findByField(UserInfo::getUsername,username );
    }

    public Optional<UserInfo> findByEmail(String email) {
        return findByField(UserInfo::getEmail,email );
    }

    public Optional<UserInfo> findByPhone(String phone) {
        return findByField(UserInfo::getPhone,phone );
    }

    public Page<UserInfo> page(PageParam pageParam, UserInfoParam param) {

        Page<UserInfo> mpPage = MpUtils.getMpPage(pageParam, UserInfo.class);
        lambdaQuery()
                .like(StrUtil.isNotBlank(param.getUsername()),UserInfo::getUsername,param.getUsername())
                .like(StrUtil.isNotBlank(param.getName()),UserInfo::getName,param.getName())
                .page(mpPage);
        return mpPage;
    }

    public boolean existsById(Long id) {
        return existedByField(UserInfo::getId,id);
    }

    public void setUpStatus(Long userId, int status) {
        lambdaUpdate().eq(MpBaseEntity::getId,userId)
                .set(UserInfo::getStatus,status)
                .update();
    }
}
