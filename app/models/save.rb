# 保存平台数据
# platforms => {"taobao"=>"淘宝","jd"=>"京东"}
def platforms(platforms)
  platform = Redis::HashKey.new('platforms')
  platform.bulk_set(platforms)
end

# 保存项目数据
# platforms => {"hululu"=>"呼噜噜","361"=>"361"}
def projects(projects)
  project = Redis::HashKey.new('projects')
  project.bulk_set(projects)
end

# 保存项目拥有的平台
# project => 'hululu'
# platform => {'jd','taobao','tmall'}
def project_platform(project, platforms)
  project_platforms = Redis::List.new('%s:' %[project])
  project_platforms << platforms
  platforms.each { |platform| project_platforms << platform }
end

# 保存每日销售数据
# today = Time.now().strftime("%Y%m%d")
def daily_sales(project, amount, today)
  daily_sales = Redis::Set.new("sales:%s:%s" %[project, today])
  daily_sales << amount
end

# 保存每月目标
# today = Time.now().strftime("%Y%m")
# goals = [{"platform"=>"jd", "goal"=>200}, {"platform"=>"361", "goal"=>600}]
def monthly_goal(project, month, goals)
  goals.each do |goal|
    monthly_target = Redis::Set.new("goal:%s:%s:%s" %[project, goal["platform"], month])
    monthly_target << goal["goal"]
  end
end