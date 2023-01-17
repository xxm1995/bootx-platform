package cn.bootx.common.actable.command;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 表配置
 * @author xxm
 * @date 2023/1/16
 */
@Getter
@Setter
public class TableConfig {

    /** 表的全部字段 */
    private List<Object> list = new ArrayList<>();

    private Map<String,Object> map = new HashMap<>();

    public TableConfig(List<Object> list, Map<String, Object> map) {
        if (list != null){
            this.list = list;
        }
        if(map != null){
            this.map = map;
        }
    }

    public TableConfig(List<Object> list) {
        if (list != null){
            this.list = list;
        }
    }

    public TableConfig(Map<String, Object> map) {
        this.map = map;
    }
}
