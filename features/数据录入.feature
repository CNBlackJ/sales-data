# language: zh-CN

功能: 店铺负责人输入当日销售数据
  为了方便我记录每天收集的销售数据
  作为店铺负责人
  我想要一个能在手机上录入销售数据的功能


  场景: 进入主页
    假设 我打开页面"/daily_sales/index"
    那么 我将看到主页有以下内容:
      | id       | name    | url                            |
      | hululu   | 呼噜噜     | /daily_sales/add?name=hululu   |
      | kk_inn   | KK(inn) | /add?name=kkinn                |
      | taotaoju | 陶陶居     | /daily_sales/add?name=taotaoju |
      | philips  | 飞利浦     | /daily_sales/add?name=philips  |
      | 361      | 361     | /daily_sales/add?name=361      |
      | mingping | 名品代发    | /daily_sales/add?name=mingping |
      | pak      | 三雄      | /daily_sales/add?name=pak      |


  场景: 动态生成输入界面
    假设 数据库中有以下平台数据:
      | key    | value                                          |
      | hululu | jd,taobao,tmall,vip,meilele,taobaocshop,amazon |
    当 我打开页面"/daily_sales/add?name=hululu"
    那么 我将看到页面出现以下的表单:
      | index | id          | label |
      | 0     | tmall       | 天猫    |
      | 1     | jd          | 京东    |
      | 2     | jd_in_house | 京东入仓  |
      | 3     | taobaocshop | 淘宝c店  |
      | 4     | vip         | 唯品会   |
      | 5     | meilele     | 美乐乐   |
      | 6     | amazon      | 亚马逊   |


  场景: 录入销售数据
    假设 我打开页面"/daily_sales/add?name=hululu"
    当 我在表单中填写以下数据,点击保存按钮:
      | element_id   | value |
      | tmall        | 2309  |
      | jd           | 0     |
      | jd_in_house  | 36275 |
      | taobaocshop | 0     |
      | vip          | 17001 |
      | meilele      | 2849  |
      | amazon       | 0     |
    那么 我将看到"保存成功"的提示框
    并且 1秒后将自动跳转到"/daily_sales/index"


  场景: 没有数据时不可保存
    当 我打开页面"/daily_sales/add?name=hululu"
    那么 保存按钮将是不可点击的


  场景: 至少有一个数据时允许保存
    当 我打开页面"/daily_sales/add?name=hululu"
    并且 我在"京东"的输入框中输入3000
    那么 我应该看到保存按钮变成了可点击的状态

