package cn.bootx.common.mybatisplus.query;

import cn.bootx.common.mybatisplus.query.annotation.QueryColumn;
import cn.bootx.common.mybatisplus.query.code.MatchTypeEnum;
import cn.bootx.common.mybatisplus.query.code.QueryConstants;
import cn.bootx.common.mybatisplus.query.code.QueryRuleEnum;
import cn.bootx.common.mybatisplus.query.entity.AutoQueryGeneratorCode;
import cn.bootx.common.mybatisplus.query.entity.CommonQuery;
import cn.bootx.common.mybatisplus.query.entity.CommonQueryItem;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;

import java.lang.reflect.Field;
import java.net.URLDecoder;
import java.util.*;

/**
 * 查询生成器
 * @author somliy
 * @author aeizzz
 * @date 2020/6/7 15:23
 * // 修改 aeizzz  20200921 合并高级查询和普通的查询
 */
@Slf4j
public class QueryGenerator {
    public static <T> QueryWrapper<T> initQueryWrapper(Object searchObj) {
        long start = System.currentTimeMillis();
        QueryWrapper<T> queryWrapper = new QueryWrapper<T>();
        handleSuperSearch(queryWrapper, null, searchObj);
        log.debug("【查询条件构造器】初始化完成 -> 耗时: " + (System.currentTimeMillis() - start) + " 毫秒");
        return queryWrapper;
    }

    public static <T> QueryWrapper<T> initQueryWrapper(Object searchObj, CommonQuery commonQuery) {
        long start = System.currentTimeMillis();
        QueryWrapper<T> queryWrapper = new QueryWrapper<T>();
        handleSuperSearch(queryWrapper, commonQuery, searchObj);
        log.debug("【查询条件构造器】初始化完成 -> 耗时: " + (System.currentTimeMillis() - start) + " 毫秒");
        return queryWrapper;
    }

    /**
     * 自定义条件查询
     *
     * @param queryWrapper
     * @param commonQuery
     */
    @SneakyThrows
    private static void handleSuperSearch(QueryWrapper<?> queryWrapper, CommonQuery commonQuery, Object searchObj) {
        // 高级查询值查询字段
        if (!Objects.isNull(commonQuery)) {
            String superQueryType, superQueryItems = "[]";
            // 类型
            if (StrUtil.isNotBlank(commonQuery.getQueryType())) {
                superQueryType = commonQuery.getQueryType();
            } else {
                superQueryType = MatchTypeEnum.AND.getType();
            }
            // 查询条件
            if (StrUtil.isNotBlank(commonQuery.getQueryItems())) {
                superQueryItems = commonQuery.getQueryItems();
            }

            try {
                superQueryItems = URLDecoder.decode(superQueryItems, "UTF-8");
                boolean flag = AutoQueryGeneratorCode.EMPTY.equals(JSONUtil.parseArray(superQueryItems).toString());
                List<CommonQueryItem> commonQueryItems = JSONUtil.parseArray(superQueryItems).toList(CommonQueryItem.class);
                if (!flag && commonQueryItems.size() > 0) {
                    log.debug("【高级查询参数】-->" + commonQueryItems.toString());

                    for (int i = 0; i < commonQueryItems.size(); i++) {
                        CommonQueryItem queryItem = commonQueryItems.get(i);
                        if (StrUtil.isNotEmpty(queryItem.getField())
                                && StrUtil.isNotEmpty(queryItem.getRule())
                                && StrUtil.isNotEmpty(queryItem.getVal())) {
                            // 构造查询条件
                            addEasyQuery(queryWrapper, queryItem.getField(), QueryRuleEnum.getByValue(queryItem.getRule()), queryItem.getVal());
                            // 如果拼接方式是OR，就拼接OR
                            if (MatchTypeEnum.OR.getType().equals(superQueryType.toUpperCase()) && i < (commonQueryItems.size() - 1)) {
                                queryWrapper.or();
                            }
                        }
                    }
                }
            } catch (Exception e) {
                log.error("【高级查询参数转码失败】：{}，{}" + superQueryItems, e);
            }
        }

        // 处理非高级查询，一般是自己在前端定义死的类型
        Field[] declaredFields = getAllFields(searchObj);
        Map<String, Object> searchMap = BeanUtil.beanToMap(searchObj);
        for (Field field : declaredFields) {
            // 设置有注解的部分字段
            if (field.getAnnotation(QueryColumn.class) != null) {
                String fieldName = field.getAnnotation(QueryColumn.class).value();
                String searchName = StrUtil.isNotBlank(fieldName) ? fieldName : field.getName();
                QueryRuleEnum type = field.getAnnotation(QueryColumn.class).type();
                if (searchMap != null && searchMap.containsKey(field.getName())) {
                    Object key = searchMap.get(field.getName());
                    if (!Objects.isNull(key)) {
                        String value = String.valueOf(searchMap.get(field.getName()));
                        addEasyQuery(queryWrapper, searchName, type, value);
                        log.debug("获取到字段名称 -> {};字段查询类型 -> {};字段数值 -> {}", searchName, type, value);
                    } else {
                        log.debug("字段 -> {},值为空", searchName);
                    }
                } else {
                    log.debug("字段 -> {},没有值", searchName);
                }

            } else {
                // 没有注解的按照eq 判断
                String searchName = field.getName();
                if(searchName.contains("sortField") || searchName.contains("sortOrder")){
                    continue;
                }
                if (searchMap != null && searchMap.containsKey(field.getName())) {
                    Object key = searchMap.get(field.getName());
                    if (!Objects.isNull(key)) {
                        String value = String.valueOf(searchMap.get(field.getName()));
                        addEasyQuery(queryWrapper, searchName, QueryRuleEnum.EQ, value);
                        log.debug("获取到字段名称 -> {};字段查询类型 -> {};字段数值 -> {}", searchName, QueryRuleEnum.EQ, value);
                    } else {
                        log.debug("字段 -> {},值为空", searchName);
                    }
                } else {
                    log.debug("字段 -> {},没有值", searchName);
                }
            }
        }
        // 设置排序功能
        if (!Objects.isNull(commonQuery) && StrUtil.isNotEmpty(commonQuery.getSortField())) {
            String column = commonQuery.getSortField();
            if (column.endsWith(QueryConstants.DICT_TEXT_SUFFIX)) {
                column = column.substring(0, column.lastIndexOf(QueryConstants.DICT_TEXT_SUFFIX));
            }
            if (StrUtil.isNotEmpty(commonQuery.getSortOrder())) {
                if (commonQuery.getSortOrder().toLowerCase().contains("ascend")) {
                    log.debug("格式 - 》 {}", StrUtil.toUnderlineCase(column));
                    queryWrapper.orderByAsc(StrUtil.toUnderlineCase(column));
                } else {
                    log.debug("格式 - 》 {}", StrUtil.toUnderlineCase(column));
                    queryWrapper.orderByDesc(StrUtil.toUnderlineCase(column));
                }
            }
        }
    }


    /**
     * 构造查询条件 自定义条件查询使用
     *
     * @param queryWrapper
     * @param fieldName
     * @param rule
     * @param val
     */
    private static void addEasyQuery(QueryWrapper<?> queryWrapper, String fieldName, QueryRuleEnum rule, String val) {
        if (StrUtil.isBlank(fieldName) || rule == null || StrUtil.isBlank(val)) {
            return;
        }
        // 驼峰 转 下划线
        fieldName = camelToUnderline(fieldName);
        log.debug("【构造查询规则】-->" + fieldName + " " + rule.getValue() + " " + val);
        switch (rule) {
            case GT:
                queryWrapper.gt(fieldName, val);
                break;
            case GE:
                queryWrapper.ge(fieldName, val);
                break;
            case LT:
                queryWrapper.lt(fieldName, val);
                break;
            case LE:
                queryWrapper.le(fieldName, val);
                break;
            case EQ:
                queryWrapper.eq(fieldName, val);
                break;
            case NE:
                queryWrapper.ne(fieldName, val);
                break;
            case IN:
                queryWrapper.in(fieldName, (Object[]) val.split(","));
                break;
            case LIKE:
                queryWrapper.like(fieldName, val);
                break;
            case LEFT_LIKE:
                queryWrapper.likeLeft(fieldName, val);
                break;
            case RIGHT_LIKE:
                queryWrapper.likeRight(fieldName, val);
                break;
            default:
                log.debug("【查询规则未匹配到】");
                break;
        }
    }

    /**
     * 将驼峰命名转化成下划线
     *
     * @param para
     * @return
     */
    public static String camelToUnderline(String para) {
        if (para.length() < 3) {
            return para.toLowerCase();
        }
        StringBuilder sb = new StringBuilder(para);
        int temp = 0;//定位
        //从第三个字符开始 避免命名不规范
        for (int i = 2; i < para.length(); i++) {
            if (Character.isUpperCase(para.charAt(i))) {
                sb.insert(i + temp, "_");
                temp += 1;
            }
        }
        return sb.toString().toLowerCase();
    }

    private static Field[] getAllFields(Object object) {
        Class<?> clazz = object.getClass();
        List<Field> fieldList = new ArrayList<>();
        while (clazz != null) {
            fieldList.addAll(new ArrayList<>(Arrays.asList(clazz.getDeclaredFields())));
            clazz = clazz.getSuperclass();
        }
        Field[] fields = new Field[fieldList.size()];
        fieldList.toArray(fields);
        return fields;
    }
}

