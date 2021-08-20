# MyBatis-Plus 扩展

## 功能
1. 提供`MpBaseEntity`对象，作为通用实体类父类
2. 提供`BaseManager`，作为 `ServiceImpl` 的替代
3. 提供`MpUtils`工具类，包含获取分页方法和分页对象转换方法
4. 配置必备的插件，见`MpConfiguration`

## 使用
1. 创建实体类是继承`MpBaseEntity`
2. 创建Manager层对象时继承`BaseManager`
3. 在一次性项目中不需要Manager层的时候，可以直接由Service继承`BaseManager`