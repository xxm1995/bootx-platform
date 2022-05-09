package cn.bootx.goods.core.goods.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* 商品关键字
* @author xxm
* @date 2022/5/9
*/
@Data
@Accessors(chain = true)
@TableName("gc_goods_words")
public class GoodsWords {
}
