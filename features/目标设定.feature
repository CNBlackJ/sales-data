# language: zh-CN

功能: 管理人员设定当月目标
  为了实时设置下月的目标
  作为管理人员
  我希望有一个页面可以设置下个月的目标,并且可以导入当月目标作为参考


  场景: 设定下月目标
    假设 我打开页面"/report/add"
    那么 我将看到目标设定页有以下内容:
      | title   | element_id |
      | 呼噜噜     | hululu     |
      | KK(inn) | kk_inn     |
      | 陶陶居     | taotaoju   |
      | 飞利浦     | philips    |
      | 361     | 361        |
      | 名品代发    | mingping   |
      | 三雄      | pak        |
    并且 页面有以下按钮:
      | title    | element_id  |
      | 2016年09月 | date        |
      | 导入上月目标   | load_target |
      | 保存       | btn_save    |


  场景: 填写目标并保存
    假设 我打开页面"/report/add"
    并且 今天是"2016"年"08"月"01"日
    并且 填写以下数据:
      | element_id | value   |
      | hululu     | 1200000 |
      | kkinn      | 200000  |
      | taotaoju   | 3000000 |
      | philips    | 2000000 |
      | 361        | 1700000 |
      | mingping   | 1200000 |
      | pak        | 360450  |
    当 点击"保存"按钮
    那么 我将会跳转到"/report/index"


  场景: 导入本月目标
    假设 我打开页面"/report/add"
    并且 今天是"2016"年"08"月"30"日
    并且 系统已有本月目标如下:
      | id | title    | target  | date    |
      | 1  | hululu   | 1200000 | 2016-08 |
      | 2  | kk_inn   | 200000  | 2016-08 |
      | 3  | taotaoju | 3000000 | 2016-08 |
      | 4  | philips  | 2000000 | 2016-08 |
      | 5  | 361      | 1700000 | 2016-08 |
      | 6  | mingping | 1200000 | 2016-08 |
      | 7  | pak      | 360450  | 2016-08 |
    当 点击"导入上月目标"按钮
    那么 我将看到表单中填充了本月目标数据如下:
      | element_id | value   |
      | hululu     | 1200000 |
      | kkinn      | 200000  |
      | taotaoju   | 3000000 |
      | philips    | 2000000 |
      | 361        | 1700000 |
      | mingping   | 1200000 |
      | pak        | 360450  |