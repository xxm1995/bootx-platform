# 超级查询器

## 功能
- 通过配置json自动生成查询器
- 支持多级嵌套查询、组合查询，
- 支持字符串、数字、布尔、日期、时间、日期时间、下拉列表等方式的字段类型
- 支持大于、小于、不等于、模糊批量、是否为空

## 使用
### 后端
在要进行查询的地方，接收`QueryParams`对象后，调用`QueryGenerator#generator`根据参数生成MyBatis Plus需要的`QueryWrapper`，然后放入查询语句进行查询

```java
/**
 * 超级查询
 */
public Page<Client> supperPage(PageParam pageParam, QueryParams queryParams) {
    QueryWrapper<Client> generator = QueryGenerator.generator(queryParams);
    Page<Client> mpPage = MpUtil.getMpPage(pageParam, Client.class);
    return this.page(mpPage,generator);
}
```

### 前端

1. 在要进行查询的页面引入超级查询器组件，`import BSuperQuery from '@/components/Bootx/SuperQuery/BSuperQuery'`

```vue
<b-super-query
  :queryState="superQueryFlag"
  :fields="queryFields"
  :width="880"
  button-title="超级查询"
  model-title="超级查询器"
  @query="superQuery"
  @rest="restQuery"
/>
```
组件对应的各项参数：

- queryState：查询状态，当前是否在进行查询
- fields：查询字段属性
- width：宽度
- button-title：按钮标题
- model-title：弹框标题
- query：点击查询时的回调
- rest：电器取消查询时的回调

2. 超级查询器各项参数说明