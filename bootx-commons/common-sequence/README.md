# sequence序列生成器

## 功能
通过redis生成一个单调递增的队列，通过redis生成一个区间，每次获取号码时本地进行生成，区间号码用完后生成并跳到新的区间。重启项目，也会跳到下个区间，预防重复。注：不适用分布式环境
## 使用
1. 配置
    ```yaml
    bootx.common.sequence:
      # redis前缀
      key_prefix: x_sequence_
      # 步长
      step: 1
      # 区间步长
      range_step: 1000
      # 区间起始位置，真实从stepStart+1开始
      range_start: 0
    ```
2. 使用
    ```java
    public class TestController {
        private final Sequence sequence;
    
        @Operation(summary = "发号器")
        @GetMapping("/sequence")
        public ResResult<Void> sequence(){
            // 通过传入业务键获取long 类型的号码,
            long l = sequence.next("cs");
            // 获取string
            String s = sequence.nextValue("cs");
            return Res.ok();
        }
    }
    ```