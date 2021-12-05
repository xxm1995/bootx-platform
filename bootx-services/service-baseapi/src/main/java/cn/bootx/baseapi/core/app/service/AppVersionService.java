package cn.bootx.baseapi.core.app.service;

import cn.bootx.baseapi.core.app.dao.AppVersionManager;
import cn.bootx.baseapi.core.app.entity.AppVersion;
import cn.bootx.baseapi.dto.app.AppVersionDto;
import cn.bootx.baseapi.param.app.AppVersionParam;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**   
* 版本管理
* @author xxm  
* @date 2021/8/9 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class AppVersionService {
    private final AppVersionManager appVersionManager;

    /**
     * 添加
     */
    public AppVersionDto add(AppVersionParam param){
        AppVersion appVersion = AppVersion.init(param);
        return appVersionManager.save(appVersion).toDto();
    }

    /**
     * 删除
     */
    public void delete(Long id){
        appVersionManager.deleteById(id);
    }

    /**
     * 检查更新
     */
    public AppVersionDto check(){
        Optional<AppVersion> appVersion = appVersionManager.findLatest();
        return appVersion.map(AppVersion::toDto).orElse(null);
    }

    /**
     * 分页
     */
    public PageResult<AppVersionDto> page(PageParam pageParam){
        return MpUtil.convert2PageResult(appVersionManager.page(pageParam));
    }

    /**
     * 获取详情
     */
    public AppVersionDto findById(Long id){
        return appVersionManager.findById(id).map(AppVersion::toDto).orElse(null);
    }

}
