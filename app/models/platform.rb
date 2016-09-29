class Platform

  # 保存平台数据
  # key = 'jd', value = '京东'
  def self.platforms(key, value)
    $redis.sadd(key, value)
  end


end