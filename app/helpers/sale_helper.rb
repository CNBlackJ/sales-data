module SaleHelper
  def get_platform
    platform = $redis.hgetall('platform')
    @platform = JSON.load platform
  end
end