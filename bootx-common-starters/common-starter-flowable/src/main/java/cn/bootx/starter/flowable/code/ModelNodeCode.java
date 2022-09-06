package cn.bootx.starter.flowable.code;

/**
 * 模型节点配置
 * @author xxm
 * @date 2022/9/4
 */
public interface ModelNodeCode {

    /* 用户分配类型 */
    /** 发起人 */
    String ASSIGN_SPONSOR = "sponsor";
    /** 用户手动选择 */
    String ASSIGN_SELECT = "select";
    /** 单用户 */
    String ASSIGN_USER = "user";
    /** 用户组 */
    String ASSIGN_USER_GROUP = "userGroup";
    /** 角色 */
    String ASSIGN_ROLE = "role";
    /** 角色组 */
    String ASSIGN_GROUP = "roleGroup";
    /** 部门成员 */
    String ASSIGN_DEPT_MEMBER = "deptMember";
    /** 部门的负责人 */
    String ASSIGN_DEPT_LEADER = "deptLeader";

}
