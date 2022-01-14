package cn.bootx.starter.file.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.starter.file.entity.UpdateFileInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**   
* 
* @author xxm  
* @date 2022/1/12 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class UpdateFileManager extends BaseManager<UpdateFileMapper, UpdateFileInfo> {
}
