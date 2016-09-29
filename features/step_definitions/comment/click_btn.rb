And(/^点击"([^"]*)"$/) do |btn|
  page.find_by_id(btn).find(:css, 'a').click
end

When(/^点击"([^"]*)"按钮$/) do |btn|
  click_button btn
end