# 数据权限
## 功能
- 数据字段字段加密解密，在数据库中存储AES加密后的内容，预防信息被脱裤后导致信息泄露
- 返回数据信息敏感信息脱敏，后端信息返回给前端时，对一些敏感信息进行脱敏，如密码、秘钥等，防止保密信息被流出，可以结合数据字段加密一起使用
- 数据权限控制，通过在线配置，实现不同的用户可以查询到不同范围的数据，更好的实现数据分级管理
- 查询字段权限控制，通过在线配置，实现不同的用户查询到不同的数据字段，更好的实现数据分级管理
## 使用说明
### 字段加密解密
**实体类配置**
​	在数据库表对应的类需要加密的字段，加上`EncryptionField`注解，该字段在进行保存或更新时自动对该字段进行加密，在读取的时候，进行解密

> 只有通过通过MyBatis-Plus对整个对象进行保存或更新时才生效，通过Wrapper进行局部更新时会导致字段加密失败，需要手动进行加密。
>
> 解密时映射对象类需要是字段加`EncryptionField`的类，否则无法识别到哪个字段是要进行解密的。
>
> 目前支持String类型的字段进行加解密

```java
@Data
@Accessors(chain = true)
@TableName("pc_alipay_config")
public class AlipayConfig {

    /** 私钥 字段进行加密保存 */
    @EncryptionField
    private String privateKey;

    /** 应用公钥证书 */
    @BigField
    @EncryptionField
    private String appCert;

    /** 支付宝公钥证书 */
    @BigField
    @EncryptionField
    private String alipayCert;

    /** 支付宝CA根证书 */
    @BigField
    @EncryptionField
    private String alipayRootCert;
}
```

**手动加解密**

```java
/**
 * 加密
 */
public Object encryptValue(Object fieldValue){
    if (fieldValue instanceof String){
        // fieldDecryptKey AES秘钥, 
        AES aes = SecureUtil.aes(fieldDecryptKey.getBytes(StandardCharsets.UTF_8));
        return aes.encryptBase64((String) fieldValue);
    } else {
        return fieldValue;
    }
}
/**
 * 解密
 */
public Object decryptValue(Object fieldValue){
    if (fieldValue instanceof String){
        AES aes = SecureUtil.aes(fieldDecryptKey.getBytes(StandardCharsets.UTF_8));
        return new String(aes.decrypt(Base64.decode((String)fieldValue)),StandardCharsets.UTF_8);
    }
    else {
        return fieldValue;
    }
}
```

**相关配置**

```yaml
bootx:
  starter:
    data-perm:
      # 字段加密AES秘钥
      field-decrypt-key: 秘钥
```

### 敏感数据脱敏

​	在要返回给前端对象类中的字段上，添加上`SensitiveInfo`主键，在数据返回前端时，字段根据设定的规则，对字段值进行脱敏

> 返回值序列化方式要为Jackson，否则会不生效。目前支持String类型的字段进行脱敏

#### 实体类配置

```java
@Data
@Accessors(chain = true)
@Schema(title = "用户信息")
public class UserInfoDto implements Serializable {
	@Schema(description= "名称")
    private String name;
    
    @Schema(description= "密码")
    @SensitiveInfo(SensitiveType.PASSWORD)
    private String password;

    @Schema(description= "手机号")
    @SensitiveInfo(SensitiveType.MOBILE_PHONE)
    private String phone;

    @Schema(description= "邮箱")
    @SensitiveInfo(SensitiveType.EMAIL)
    private String email;
}
```

#### 注解配置

- `value` 敏感信息类型，参数为`SensitiveType`敏感信息脱敏类型枚举，具体类型如下
  - `CHINESE_NAME` 中文名，只显示第一个汉字，其他隐藏为2个星号，比如：李**
  - `USER_ID` 用户ID，userId 统一替换为 0L，
  - `PASSWORD` 密码，密码的全部字符都用*代替，比如：`******`
  - `ID_CARD` 身份证号，只显示前六位和后两位，如`370112**********1X`
  - `FIXED_PHONE` 座机号，显示前四位，后两位
  - `MOBILE_PHONE` 手机号，前三位，后4位，其他隐藏，`比如135****2210`
  - `IP` IP地址，只显示前两段ip，`如192.168.*.*`
  - `ADDRESS` 地址，只显示到地区(前6位)，不显示详细地址，比如：`北京市海淀区****`
  - `EMAIL` 电子邮件地址，邮箱前缀仅显示第一个字母，前缀其他隐藏，用星号代替，@及后面的地址显示，比如：`d**@foxmail.com`
  - `BANK_CARD` 中国大陆车牌，车牌中间用\*代替，如`鲁A8***0`
  - `BANK_CARD` 银行卡，卡号脱敏 : `1101 **** **** **** 3256`
  - `CNAPS_CODE` 公司开户银行联号，中间用*号代替
  - `OTHER` 其他，通过`front`和`end`属性来决定保留前面或后面几个字符正常显示
- `front` 保留：前面的front位数；从1开始，敏感类型为其他时可用
- `end` 保留：后面的end位数；从1开始，敏感类型为其他时可用

#### 前端编辑修改

​	当被脱敏的字段数据返回前端后进行修改时，点击保存会将脱敏后的数据原样回传回后台，导致加密字段被更新，产生错误的数据，所以针对这个情况，提供一种解决思路，代码如下

```vue
<template>
  <a-modal>
    <a-form-model
      ref="form"
      :model="form">
      <a-form-model-item label="主键" prop="id" hidden="true" >
        <a-input v-model="form.id" :disabled="showable"/>
      </a-form-model-item>
      <a-form-model-item
        label="编号"
        prop="password"
      >
        <a-input-password
          v-model="form.password"
          placeholder="为空不修改密码"
          :disabled="showable"/>
      </a-form-model-item>
    </a-form-model>
  </a-modal>
</template>
<script>
import { FormMixin } from '@/mixins/FormMixin'
    
export default {
  name: 'MailConfigEdit',
  mixins: [FormMixin],
  data () {
    return {
      // 从服务器获取的原始数据信息
      rawForm: {},
      form: {
        code: '',
        username: ''
      },
    }
  },
  computed: {
    diff () {
      return {
        // 监视加密字段是否发生了变动
        password: this.diffForm(this.form.password, this.rawForm.password)
      }
    }
  },
  methods: {
    // 可以视为要进行编辑时，向后端数据获取数据
    edit (id, type) {
        get(id).then(res => {
          this.form = res.data
          // 保存服务端返回的原始信息
          this.rawForm = { ...res.data }
          this.confirmLoading = false
        })
    },
    handleOk () {
      this.$refs.form.validate(async valid => {
        if (valid) {
          // 进行更新时，使用监视的加密数据来替换表单中的数据，（数据为null时，后端不进行修改）
          await update({
            ...this.form,
            ...this.diff
          })
        } else {
          return false
        }
      })
    },
    // 判断脱敏参数是否被修改的参数, 未修改则返回空值 （FormMixin中提供的方法）
    diffForm (o1, o2) {
      return o1 === o2 ? null : o1
    }
  }
}
```

