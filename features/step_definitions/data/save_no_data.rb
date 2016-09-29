Then(/^保存按钮将是不可点击的$/) do
  page.find_by_id('btn_save_dis')['disabled'].should have_content 'disabled'
end