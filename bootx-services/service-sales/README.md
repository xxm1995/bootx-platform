# 销售中心

## 介绍

## 核心概念
- 策略定义
- 策略注册
- 策略参数定义
- 策略参数配置
- 优惠活动
- 优惠券模板
- 优惠券
- 检查规则
- 匹配规则
- 特征点
- 优惠互斥
- 优惠叠加(使用平行优惠)

## 核心流程时序图
### 优惠选择时序图
![优惠选择时序图](https://images.gitee.com/uploads/images/2021/0811/161133_c69de0a1_524686.png "优惠选择时序图.png")
### 优惠检查时序图
![优惠检查时序图](https://images.gitee.com/uploads/images/2021/0811/161231_ac273a5e_524686.png "优惠检查时序图.png")
### 优惠计算时序图
![优惠计算时序图](https://images.gitee.com/uploads/images/2021/0811/161258_b6479e84_524686.png "优惠计算时序图")

## 说明
1. 策略定义
    一种行为的抽象定义，如满减，满折，立减就是一种优惠策略，首次购买、需要身份是会员、生日当天可用就是一种检测策略
   策略定义根据执行引擎分，有Java原生、Groovy脚本引擎和JavaScript引擎
    - Java原生，通常推荐使用这种类型，性能最优，运行稳定，缺点是无法在运行时进行动态修改
    - JavaScript，可以被热部署，编写脚本保存到数据库中就可以生效，但是无法访问和调用传入参数之外的资源
    - Groovy，相对于JavaScript，Groovy脚本在执行的时候可以调用项目中的Java代码，能实现更灵活的
    根据应用目标分，有计算、检查、匹配三种。

2. 策略注册
    策略注册分为优惠活动和优惠券模板，把策略定义看为类的话，策略注册就是根据定义创建的一个个对象，如一个满减策略就可以创建出90-50、30-20，5-4等多种满减方式
3. 策略参数定义
   和策略定义是一对多关系，一个策略定义会有多个策略参数定义，把策略定义看做一个函数的话，策略参数定义就是函数的入参定义，例如一个满减策略，需要配置满多少减多少，满多少和减多少就是两个策略参数定义。
4. 策略参数配置
   拿90-50满减策略打比喻，通过策略定义创建出这个具体的满减策略时，90和50就是要配置参数。策略参数配置依赖于策略注册，可以视为是创建对象时，所传入的参数值
5. 优惠活动
   只要用户符合条件就可以参加的优惠，如双十一全场300-40活动，具体体现可以看看京东，
6. 优惠券模板
    根据优惠券模板可以定义将要发送多少张优惠券，使用领取时的限定条件，具体的优惠措施等
7. 优惠券
    在购物支付时可以使用的卡券，与活动不同的是，优惠券需要自己手动领取
8. 检查规则
    检查传入订单选择的优惠是否合法，分为优惠活动检查和优惠券检查，有领取检查、选择检查和使用检查。一个检查规则会对应到一个策略定义上，
9. 匹配规则
    根据特征点匹配关系进行匹配对应策略，核心属性是特征类型、特征点和匹配类型构成
    - 特征类型 如商品分类、所属商店等
    - 特征点 如电子产品，Apple自营店
    - 匹配类型 例如，属于、不属于、大于、小于等
10. 特征点
    对传入订单参数进行特征点提取，通过特征点判断是否适用对应的优惠策略，目前抽取特征点算法都是通过java编写，暂不支持其他语言引擎

## 使用说明
### 添加策略定义

参数对象说明

策略定义对象 `cn.bootx.sales.param.strategy.StrategyParam`
策略参数定义对象 `cn.bootx.sales.param.strategy.StrategyConfigParam`

通过code和engineType参数找到要执行的优惠策略，想要增加对应的java原生类型策略，需要实现对应接口，并将策略类注册到Spring的Bean容器中
1. 检查策略，实现`AbstractCheckRule`接口
2. 计算策略，实现`JavaCalculateHandler`接口
3. 特征点提取规则，实现`FeatureHandler`接口(虽然不属于策略定义, 但定义方式类似,这也放一份了)


### 检查规则

计算时具体执行逻辑通过

**检查规则对象 CheckRuleParam**

| 参数       | 名称     | 说明                                       |
| ---------- | -------- | ------------------------------------------ |
| priority   | 优先级   | 运行时的顺序，优先级越高越靠前             |
| name       | 规则名称 | 名称                                       |
| code       | 规则code | 编码                                       |
| ruleType   | 规则类型 | 优惠券模板类型和活动类型                   |
| strategyId | 策略id   | 策略定义的id， 用来关联到检查策略          |
| addition   | 附加对象 | 计算时所需要的参数，相当于策略运行时的参数 |

### 匹配规则

**匹配规则对象 MatchRuleParam**

| 参数         | 名称     | 说明                          |
| ------------ | -------- | ----------------------------- |
| featureType  | 特征类型 | 要被抽取特征点的类型，如skuId |
| featurePoint | 特征点   | 具体的特征点值                |
| matchType    | 匹配类型 | 和订单进行匹配的明细          |

1. 新增特征点提取规则，实现`FeatureHandler`接口

### 添加活动

第一需要设置应用的是那种策略，第二是设置会根据哪些特征点进行匹配，第三是选择、使用等时候的检查规则

参数对象说明

活动参数对象 `cn.bootx.sales.param.activity.ActivityParam`
策略参数值 `cn.bootx.sales.param.strategy.StrategyConfigValueParam`
检查规则参数 `cn.bootx.sales.param.strategy.CheckRuleParam`
匹配配置 `cn.bootx.sales.param.strategy.MatchRuleParam`

### 添加优惠劵模板

基本同优惠活动，第一需要设置应用的是那种策略，第二是设置会根据哪些特征点进行匹配，第三是领取、使用等时候的检查规则, 第四是优惠券特有的一些配置

参数对象说明
优惠券模板 `cn.bootx.sales.param.coupon.CouponTemplateParam`
策略参数值 `cn.bootx.sales.param.strategy.StrategyConfigValueParam`
检查规则参数 `cn.bootx.sales.param.strategy.CheckRuleParam`
匹配配置 `cn.bootx.sales.param.strategy.MatchRuleParam`

### 计算价格
调用 `cn.bootx.sales.core.calculate.service.OrderPreviewService`的 `previewOrderPrice`或者`previewOrderPriceNoCheck`方法

### 缓存构建
因为计算时或对订单策略进行监察室会访问很多数据，io开销较大，为了提高预算是的速度，在进行计算之前，会提前缓存计算过程中所需要的数据，参见`CalculateFactory`和`CalculateCache`对象