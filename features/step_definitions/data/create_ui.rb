require 'redisdb'
Given(/^数据库中有以下平台数据:$/) do |table|
  # table is a table.hashes.keys # => [:key, :value]
  table.hashes.each do |row|
    Redisdb.project_platform(row[:key], row[:value].split(","))
  end
end

Then(/^我将看到页面出现以下的表单:$/) do |table|
  # table is a table.hashes.keys # => [:element_id, :label]
  table.hashes.each do |row|
    page.find_all("label")[row[:index].to_i].should have_content row[:label]
  end
end