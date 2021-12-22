package cn.bootx.starter.data.perm.data;

import java.util.List;

/**
* 数据权限业务实现接口
* @author xxm
* @date 2021/12/22
*/
public interface DataPermHandler {

    /**
     * 返回数据权限查询条件的集合
     */
    List<Long> whereIds();
}
