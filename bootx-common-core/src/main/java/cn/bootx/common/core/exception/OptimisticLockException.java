package cn.bootx.common.core.exception;

import java.io.Serializable;

import static cn.bootx.common.core.rest.CommonErrorCodes.DATA_OUT_OF_DATE;

/**
 * 乐观锁异常
* @author xxm
* @date 2020/4/15 14:11
*/
public class OptimisticLockException extends SystemException implements Serializable {
    private static final long serialVersionUID = -1605410024618499135L;

    public OptimisticLockException(int code, String message) {
		super(code, message);
	}

	public OptimisticLockException(){
		super(DATA_OUT_OF_DATE,"乐观锁异常,数据过期");
	}
}
