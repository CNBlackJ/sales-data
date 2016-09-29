And(/^我在"([^"]*)"的输入框中输入(\d+)$/) do |platform, amount|
  page.find("input[placeholder='%s']" % [platform]).set amount
end

Then(/^我应该看到保存按钮变成了可点击的状态$/) do
  page.find_by_id('btn_save')['disabled'].should have_content ''
end