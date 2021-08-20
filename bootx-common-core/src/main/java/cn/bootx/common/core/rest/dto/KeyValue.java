package cn.bootx.common.core.rest.dto;

import java.io.Serializable;

/**
* kv键值对象
* @author xxm
* @date 2021/5/18
*/
public class KeyValue implements Serializable {
    private static final long serialVersionUID = 3427649251589010105L;
    /** 键 */
    private String key;
    /** 值 */
    private String value;

    public KeyValue() {
    }

    public KeyValue(String key, String value) {
        this.key = key;
        this.value = value;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
