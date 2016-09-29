When(/^设定好的目标数据将会存入到数据库:$/) do |table|
  # table is a table.hashes.keys # => [:hululu, :kk_inn, :taotaoju, :philips, :361, :mingping, :pak]
  pending
end

When(/^我在表单中填写以下数据,点击保存按钮:$/) do |table|
  # table is a table.hashes.keys # => [:element_id, :value]
  table.hashes.each do |row|
    fill_in row[:element_id], :with => row[:value]
  end
  click_button 'btn_save'
end

When(/^我将看到"([^"]*)"的提示框$/) do |message|
  puts current_path
  page.find_by_id("save_success").should have_content(message)
end

When(/^1秒后将自动跳转到"([^"]*)"$/) do |url|
  current_path.should equal? url
end