# language: zh-CN

功能: 经理查看当前最新的报表数据
  为了能够更快速的查阅前一天或一段时间的销售数据
  作为经理等主管人员
  我想要能够进入到主页就看到前一天的销售数据,我还可以查看之前的数据;
  每个月我还可以在这里设置下月的目标.

  背景:
    假设 数据库有以下目标数据
      | project      | target  | month  |
      | hululu       | 2200000 | 201608 |
      | kkinn        | 250000  | 201608 |
      | taotaoju     | 3000000 | 201608 |
      | feilipu      | 2000000 | 201608 |
      | 361          | 1700000 | 201608 |
      | mingpindaifa | 1200000 | 201608 |
      | sanxion      | 300000  | 201608 |
      | hululu       | 2200000 | 201609 |
      | kkinn        | 250000  | 201609 |
      | taotaoju     | 3000000 | 201609 |
      | feilipu      | 2000000 | 201609 |
      | 361          | 1700000 | 201609 |
      | mingpindaifa | 1200000 | 201609 |
      | sanxion      | 300000  | 201609 |
    并且 有以下每日销售额数据
      | project      | platform | day      | sales     |
      | hululu       | tm       | 20160907 | 230876    |
      | hululu       | tm       | 20160908 | 3018      |
      | hululu       | jd       | 20160908 | 0         |
      | hululu       | jdrk     | 20160908 | 35178     |
      | hululu       | tbcd     | 20160908 | 1439      |
      | hululu       | wph      | 20160908 | 24246     |
      | hululu       | mll      | 20160908 | 0         |
      | hululu       | ymx      | 20160908 | 0         |
      | hululu       | tm       | 20160909 | 1498      |
      | hululu       | jd       | 20160909 | 3828      |
      | hululu       | jdrk     | 20160909 | 57522     |
      | hululu       | tbcd     | 20160909 | 2868      |
      | hululu       | wph      | 20160909 | 14652     |
      | hululu       | mll      | 20160909 | 0         |
      | hululu       | ymx      | 20160909 | 0         |
      | hululu       | tm       | 20160910 | 0         |
      | hululu       | jd       | 20160910 | 5507      |
      | hululu       | jdrk     | 20160910 | 38370     |
      | hululu       | tbcd     | 20160910 | 0         |
      | hululu       | wph      | 20160910 | 11983     |
      | hululu       | mll      | 20160910 | 0         |
      | hululu       | ymx      | 20160910 | 0         |
      | hululu       | tm       | 20160911 | 9177      |
      | hululu       | jd       | 20160911 | 1576      |
      | hululu       | jdrk     | 20160911 | 33673     |
      | hululu       | tbcd     | 20160911 | 1927      |
      | hululu       | wph      | 20160911 | 26794     |
      | hululu       | mll      | 20160911 | 0         |
      | hululu       | ymx      | 20160911 | 0         |
      | kkinn        | tm       | 20160907 | 209964    |
      | kkinn        | tm       | 20160908 | 2275      |
      | kkinn        | tm       | 20160909 | 2435      |
      | kkinn        | tm       | 20160910 | 1427      |
      | kkinn        | tm       | 20160911 | 2634      |
      | taotaoju     | tm       | 20160907 | 52695.14  |
      | taotaoju     | tm       | 20160908 | 5716      |
      | taotaoju     | jd       | 20160909 | 9647.9    |
      | taotaoju     | yhd      | 20160910 | 9297.2    |
      | taotaoju     | yhd      | 20160911 | 8304.9    |
      | feilipu      | tm       | 20160907 | 221239.69 |
      | feilipu      | jd       | 20160907 | 166593.2  |
      | feilipu      | tm       | 20160808 | 3749.31   |
      | feilipu      | jd       | 20160908 | 21382.76  |
      | feilipu      | tm       | 20160909 | 31241     |
      | feilipu      | jd       | 20160909 | 20197.8   |
      | feilipu      | tm       | 20160910 | 30665     |
      | feilipu      | jd       | 20160910 | 24156.8   |
      | feilipu      | tm       | 20160911 | 37428.7   |
      | feilipu      | jd       | 20160911 | 20319.2   |
      | 361          | tm       | 20160907 | 55423.3   |
      | 361          | tm       | 20160908 | 9023      |
      | 361          | tm       | 20160909 | 7134      |
      | 361          | tm       | 20160910 | 8861      |
      | 361          | tm       | 20160911 | 9087      |
      | mingpindaifa | sd       | 20160907 | 11127.72  |
      | mingpindaifa | sd       | 20160908 | 5025.45   |
      | mingpindaifa | kd       | 20160909 | 11103.86  |
      | mingpindaifa | sd       | 20160910 | 4373.58   |
      | mingpindaifa | kd       | 20160911 | 5076.97   |
      | sanxion      | tm       | 20160908 | 28476     |
      | sanxion      | jd       | 20160908 | 27348     |
      | sanxion      | tm       | 20160909 | 8524      |
      | sanxion      | jd       | 20160909 | 3718      |
      | sanxion      | tm       | 20160910 | 5309      |
      | sanxion      | jd       | 20160910 | 5247.84   |
      | sanxion      | tm       | 20160911 | 2973      |
      | sanxion      | jd       | 20160911 | 3884.14   |

  场景: 进入管理人员主页
    假设 我打开页面"/report/index"
    并且 今天是"20160811"
    那么 我将看到"8"月的月度目标为"10650000",已完成"1528039.28",完成率为"14.35%"
    并且 看到以下图表
      | name | redirect_url              |
      | 线性图  | /report/line_series       |
      | 饼图   | /report/pie_chart         |
      | 每月饼图 | /report/pie_chart_monthly |
      | 每年饼图 | /report/pie_chart_yearly  |
    并且 看到以下表格
      | 项目      | 月度目标    | 完成率    |
      | 呼噜噜     | 2200000 | 24.52% |
      | KK(inn) | 250000  | 10.05% |
      | 陶陶居     | 3000000 | 3.76%  |
      | 飞利浦     | 2000000 | 31.95% |
      | 361     | 1700000 | 5.72%  |
      | 名品代发    | 1200000 | 3.06%  |
      | 三雄      | 300000  | 28.49% |


  场景: 进入呼噜噜品牌报表页
    假设 我打开页面"/report/index"
    并且 今天是"20160811"
    并且 点击"hululu"
    那么 我将看到"8"月的月度目标为"2200000",已完成"539340",完成率为"24.52%"
    并且 看到以下图表
      | name | redirect_url              |
      | 线性图  | /report/line_series       |
      | 饼图   | /report/pie_chart         |
      | 每月饼图 | /report/pie_chart_monthly |
      | 每年饼图 | /report/pie_chart_yearly  |
    并且 看到以下表格
      | 平台   | 昨日完成  | 累计完成   |
      | 天猫   | 0     | 235392 |
      | 京东   | 5507  | 9335   |
      | 京东入仓 | 38370 | 131070 |
      | 淘宝c店 | 0     | 4307   |
      | 唯品会  | 11983 | 11983  |
      | 美乐乐  | 0     | 0      |
      | 亚马逊  | 0     | 0      |


