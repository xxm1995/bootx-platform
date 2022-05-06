filebeat输出到ES配置
```yaml
filebeat.inputs:
- type: log
  enabled: true
  paths:
    - /data/logs/bootx-platform/*.json
# 输出到es
output.elasticsearch:
  hosts: localhost:9200
  # 索引名
  index: "bootx-platform-logs"
# 设置
setup:
# 自定义索引的话必须设置
  template:
    name: "filebeat"
    pattern: "filebeat-*"
  ilm.enabled: false

processors:
  - decode_json_fields:
      fields: ['message'] #要进行解析的字段
      target: "" #json内容解析到指定的字段，如果为空（“”），则解析到顶级结构下
  - drop_fields:
      fields: ["log","ecs","agent","input","@metadata","message"] #删除无用的字段
```

日志索引格式
```json
{
  "mappings": {
      "properties":{
        "@timestamp":{"type":"date"},
        "log_time":{"type":"date"},
        "severity":{"type":"keyword"},
        "service":{"type":"keyword"},
        "trace":{"type":"keyword"},
        "class":{"type":"keyword"},
        "rest":{"type":"text"},
        "stack_trace":{"type":"text"},
        "thread_name":{"type":"keyword"},
        "host":{
          "properties": {
            "name": {"type": "keyword"}
          }
        }
      }
  }
}
```