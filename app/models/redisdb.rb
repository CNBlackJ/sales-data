# class Redisdb < ActiveRecord::Base
#
#   # 保存平台数据
#   # key='jd' value='京东'
#   def self.platforms(key, value)
#     key = 'platform:%s' % key
#     $redis.set(key, value)
#   end
#
#   # 保存项目数据
#   # key = 'hululu' value = '呼噜噜'
#   def self.projects(key, value)
#     key = 'project:%s' % key
#     $redis.set(key, value)
#   end
#
#   # 得到平台/项目数据
#   # type = project(platform)
#   def self.getter(type)
#     keys = $redis.keys('%s:*' %type)
#     # Hash[keys[1].zip $redis.mget(keys[1])]
#     result = []
#     keys.each { |key| result.push({label: $redis.get(key), id: key.split(":")[1]}) }
#     result
#   end
#
#   # 保存项目拥有的平台
#   # project => 'hululu'
#   # platform => {'jd','taobao','tmall'}
#   def self.project_platform(project, platforms)
#     key = 'platforms:%s' %[project]
#     platforms.each { |platform| $redis.sadd(key, platform) }
#   end
#
#   # 获得项目拥有的平台数据
#   def self.get_project_platforms(project)
#     keys = $redis.smembers("platforms:%s" %project)
#     result = []
#     keys.each { |key| result.push({label: $redis.get("platform:%s"%key), id: key}) }
#     result
#   end
#
#   # 保存每日销售数据
#   # today = Time.now().strftime("%Y%m%d")
#   # platforms = ['jd', 'taobao']
#   def self.daily_sales(project, platforms, today, amount)
#     platforms.each do |platform|
#       key = "sales:%s:%s:%s" %[project, platform, today]
#       $redis.set(key, amount)
#     end
#   end
#
#   # 保存每月目标
#   # today = Time.now().strftime("%Y%m")
#   # goals = [{"platform"=>"jd", "goal"=>200}, {"platform"=>"361", "goal"=>600}]
#   def self.monthly_goal(project, month, goals)
#     goals.each do |goal|
#       key = "goal:%s:%s:%s" %[project, goal["platform"], month]
#       $redis.set(key, goal["goal"])
#     end
#   end
# end


class Platform < ActiveRecord::Base
  included Redis::Objects
end

class Project < ActiveRecord::Base
  included Redis::Objects
  list :platforms

  def save_turnover(date, platform, val)
  end

  def set_goal(date, val)
  end

end

