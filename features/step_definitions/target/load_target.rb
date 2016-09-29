Given(/^系统已有本月目标如下:$/) do |table|
  # table is a table.hashes.keys # => [:id, :title, :target, :date]
  table.hashes.each do |row|
    key = row[:date]+':'+row[:title]
    $redis.set(key, row[:target])
  end
end

Then(/^我将看到表单中填充了本月目标数据如下:$/) do |table|
  # table is a table.hashes.keys # => [:title, :target]
  table.hashes.each do |row|
    input_id = "input[id$='"+row[:element_name]+"']"
    page.find(:css, input_id).should have_content row[:target]
  end
end