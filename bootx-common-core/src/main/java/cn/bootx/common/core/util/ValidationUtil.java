package cn.bootx.common.core.util;


import cn.bootx.common.core.exception.ValidationFailedException;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.util.Set;

/**   
* BeanValidation 工具类
* @author xxm  
* @date 2020/5/26 18:14 
*/
public class ValidationUtil {

    private ValidationUtil() {
    }

    private static final ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();

    /**
     * 验证参数对象，如果验证失败则抛出异常
     */
    public static void validateParam(Object paramObject) {
        Validator validator = validatorFactory.getValidator();
        Set<ConstraintViolation<Object>> violations = validator.validate(paramObject);
        if (!violations.isEmpty()) {
            throw new ValidationFailedException(extractMessages(violations));
        }
    }

    private static String extractMessages(Set<ConstraintViolation<Object>> violations) {
        StringBuilder message = new StringBuilder();
        for (ConstraintViolation<Object> violation : violations) {
           message.append(violation.getMessage()).append(System.lineSeparator());
        }
        return message.toString();
    }

    /**
     * 验证参数对象，如果验证失败则返回所有失败信息
     */
    public static String validate(Object paramObject){
        Validator validator = validatorFactory.getValidator();
        Set<ConstraintViolation<Object>> violations = validator.validate(paramObject);

        StringBuilder message = new StringBuilder();
        for (ConstraintViolation<Object> violation : violations) {
            message.append(violation.getMessage()).append("\n");
        }

        return message.toString();
    }
}
