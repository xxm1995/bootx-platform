package cn.bootx.iam.core.permission.service;

import cn.bootx.common.core.annotation.OperateLog;
import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.permission.convert.PermConvert;
import cn.bootx.iam.core.permission.dao.PermPathManager;
import cn.bootx.iam.core.permission.entity.PermPath;
import cn.bootx.iam.core.upms.dao.RolePathManager;
import cn.bootx.iam.dto.permission.PermPathDto;
import cn.bootx.iam.param.permission.PermPathParam;
import cn.bootx.starter.data.perm.request.entity.RequestPerm;
import cn.bootx.starter.data.perm.request.service.RequestPermService;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.util.StrUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;


/**
 * 请求权限
 * @author xxm
 * @date 2020/5/10 23:20
 */
@Service
@AllArgsConstructor
public class PermPathService {
    private final PermPathManager permPathManager;
    private final RolePathManager rolePathManager;

    private final RequestPermService requestPermService;

    /**
     * 添加权限信息
     */
    public PermPathDto add(PermPathParam param){
        PermPath permPath = PermPath.init(param);
        return permPathManager.save(permPath).toDto();
    }

    /**
     * 更新权限信息
     */
    public PermPathDto update(PermPathParam param){
        PermPath permPath = permPathManager.findById(param.getId())
                .orElseThrow(() -> new BizException("信息不存在"));
        BeanUtil.copyProperties(param, permPath,CopyOptions.create().ignoreNullValue());
        return permPathManager.updateById(permPath).toDto();
    }

    /**
     * 删除
     */
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id){
        rolePathManager.deleteByPermission(id);
        permPathManager.deleteById(id);
    }

    /**
     * 获取单条
     */
    public PermPathDto findById(Long id){
        return permPathManager.findById(id).map(PermPath::toDto)
                .orElse(null);
    }

    /**
     * 根据ids查询权限信息
     */
    public List<PermPathDto> findByIds(List<Long> ids){
        return ResultConvertUtil.dtoListConvert(permPathManager.findAllByIds(ids));
    }

    /**
     * 列表
     */
    public List<PermPathDto> findAll() {
        return ResultConvertUtil.dtoListConvert(permPathManager.findAll());
    }

    /**
     * 权限分页
     */
    public PageResult<PermPathDto> page(PageParam pageParam, PermPathParam param){
        return MpUtil.convert2PageResult(permPathManager.page(pageParam,param));
    }

    /**
     * 同步系统请求资源
     */
    @Transactional(rollbackFor = Exception.class)
    @OperateLog
    public void syncSystem() {
        List<RequestPerm> systemRequests = requestPermService.getSystemRequests();
        List<PermPath> permPaths = systemRequests.stream()
                .map(requestPerm -> {
                    PermPath permPath = PermConvert.CONVERT.convert(requestPerm);
                    // 请求权限码
                    String code = null;
                    if (StrUtil.isNotBlank(requestPerm.getClassName()) && StrUtil.isNotBlank(requestPerm.getMethodName())){
                        code = requestPerm.getClassName()+ "#" +requestPerm.getMethodName();
                    }
                    // 请求备注
                    String remark = null;
                    if (StrUtil.isNotBlank(requestPerm.getClassRemark()) && StrUtil.isNotBlank(requestPerm.getMethodRemark())){
                        remark = requestPerm.getClassRemark()+ " " +requestPerm.getMethodRemark();
                    }
                    return permPath.setCode(code)
                            .setName(requestPerm.getMethodRemark())
                            .setRemark(remark)
                            .setGroupName(requestPerm.getClassRemark())
                            .setSystem(true)
                            .setEnable(true);
                }).collect(Collectors.toList());
        // 增量更新
        this.incrementAdd(permPaths);
    }

    /**
     * 增量添加，对不存在的进行添加
     */
    private void incrementAdd(List<PermPath> permPaths){
        List<String> paths = permPathManager.findAll().stream()
                .map(PermPath::getPath)
                .collect(Collectors.toList());
        // 过滤掉已经存在的
        List<PermPath> permPathList = permPaths.stream()
                .filter(permPath -> !paths.contains(permPath.getPath()))
                .collect(Collectors.toList());
        permPathManager.saveAll(permPathList);
    }
}
