package cn.bootx.common.sequence.range;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.concurrent.atomic.AtomicLong;

/**
 * 序列号区间对象模型
 * @author xuan on 2018/1/10.
 */
@Data
@Accessors(chain = true)
public class SeqRange {

	/**
	 * 区间的序列号开始值
	 */
	private final long min;
	/**
	 * 区间的序列号结束值
	 */
	private final long max;
	/**
	 * 区间的序列号当前值
	 */
	private final AtomicLong value;
	/**
	 * 区间的序列号是否分配完毕，每次分配完毕就会去重新获取一个新的区间
	 */
	private volatile boolean over = false;

	public SeqRange(long min, long max) {
		this.min = min;
		this.max = max;
		this.value = new AtomicLong(min);
	}

	/**
	 * 返回并递增下一个序列号
	 *
	 * @return 下一个序列号，如果返回-1表示序列号分配完毕
	 */
	public long getAndIncrement() {
		long currentValue = value.getAndIncrement();
		if (currentValue > max) {
			over = true;
			return -1;
		}
		return currentValue;
	}
}
