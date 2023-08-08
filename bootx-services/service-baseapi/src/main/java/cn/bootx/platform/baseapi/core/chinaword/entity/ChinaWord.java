package cn.bootx.platform.baseapi.core.chinaword.entity;

import cn.bootx.mybatis.table.modify.annotation.DbTable;
import cn.bootx.platform.common.mybatisplus.base.MpDelEntity;
import cn.bootx.platform.common.mybatisplus.handler.StringListTypeHandler;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * 敏感词
 * @author xxm
 * @since 2023/8/8
 */
@EqualsAndHashCode(callSuper = true)
@Data
@DbTable(comment = "敏感词")
@Accessors(chain = true)
@TableName(value = "base_china_word",autoResultMap = true)
public class ChinaWord extends MpDelEntity {

    /** 敏感词 */
    private String name;
    /** 描述 */
    private String description;
    /**
     * 标签数组
     * 不同的业务场景下，需要启用不同标签的敏感词。
     *
     */
    @TableField(typeHandler = StringListTypeHandler.class)
    private List<String> tags;
    /** 是否启用 */
    private Boolean enable;
}
