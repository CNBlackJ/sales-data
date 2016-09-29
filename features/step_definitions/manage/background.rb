When(/^数据库有以下目标数据$/) do |table|
  # table is a table.hashes.keys # => [:project, :target, :month]
  # $redis.flushdb
  table.hashes do |row|
    $redis.set("goal:"+row[:project]+":"+row[:month],row[:target])
  end
end

When(/^有以下每日销售额数据$/) do |table|
  # table is a table.hashes.keys # => [:project, :platform, :day, :sales]
  table.hashes do |row|
    $redis.set("sales:"+row[:project]+":"+row[:platform]+":"+row[:day],row[:sales])
  end
end