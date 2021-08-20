package cn.bootx.common.core.util;

import java.util.regex.Pattern;

/**
 * @author network
 **/
public class RegexUtil {

    private static final String EMAIL_REGEX = "[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?";
    private static final String PHONE_REGEX = "^\\+[1-9]\\d*|0$";

    private RegexUtil() {

    }


    public static boolean isEmailPattern(String content) {

        return Pattern.matches(EMAIL_REGEX, content);
    }

    public static boolean isPhonePattern(String content) {

        return Pattern.matches(PHONE_REGEX, content);
    }
}
