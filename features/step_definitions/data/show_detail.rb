Then(/^我将看到详情页有以下内容:$/) do |table|
  # table is a table.hashes.keys # => [:title, :element_name]
  table.hashes.each do |row|
    page.find(:xpath, "id('"+row[:element_id]+"')/li[1]").should have_content row[:title]
  end
  page.find_by_id("btn_save").should have_content "保存"
end