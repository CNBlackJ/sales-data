When(/^我将看到目标设定页有以下内容:$/) do |table|
  # table is a table.hashes.keys # => [:title, :element_name]
  table.hashes.each do |row|
    #0 page.find_by_id(row[:title]).should have_content row[:title]
    page.find(:xpath, "id('"+row[:element_id]+"')/li[1]").should have_content row[:title]
  end
end

When(/^页面有以下按钮:$/) do |table|
  # table is a table.hashes.keys # => [:title, :element_name]
  table.hashes.each do |row|
    page.find_by_id(row[:element_id]).should have_content row[:title]
  end
end