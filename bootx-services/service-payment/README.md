# 支付中心

## 介绍

## 能力
1. 支付
    - 支付宝
    - 微信
    - 银联云闪付
    - 电子钱包
    - 现金支付
2. 组合支付，支持三方支付和自有（钱包、现金等）共同使用
4. 聚合支付，支持微信支付宝的聚合扫码和付款码支付
5. 支付记录
6. 支付回调记录
7. 分账

## 核心概念
### 对象
- Payment 主支付记录: 用于记录当前支付的公共信息，同时每个不同的支付方式都有对应的子payment，比如：AliPayPayment，WeChatPayment，PointPayment等
- PayChannel 支付通道，例如支付宝、微信、钱包、现金等，包含通道网关地址，支持具体支付方式等
- PayMode 支付方式 与支付通道相对应，支付方式会更细化，PayMode包含具体支付类型（扫码、付款码）和支付金额,以及支付扩展参数。
- OrderBilling 账单，每个PayMode生成一个账单。
- OrderBillingItem 账单项 每个支付的项都会在其支持的PayMode下面生成一个对应的账单项。
###其他
- 同步支付 调用支付后直接就完成支付的支付方式
- 异步支付 调用支付后，需要支付通道网关回调才能确认支付完成的支付方式，如支付宝、微信、云闪付等三方支付
## 使用

### 支付路由 

### 支付调用
> 通常支付前会先下订单，然后再进行支付，订单号做为业务单号。演示DEMO参见shop-engine文档

1. 根据传入请求，组装出PayMode支付方式参数，
2. 组装请求参数，调用pay方法，根据返回值进行下一步操作
3. 如果是同步支付，直接根据返回的payment对象进行处理
4. 如果是异步支付方式，获取返回异步支付参数，根据异步支付参数调起支付
