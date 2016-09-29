Given(/^我打开页面"([^"]*)"$/) do |url|
  visit url
  status_code == 200
end

Then(/^我将会跳转到"([^"]*)"$/) do |url|
  expect(page).to have_current_path(url)
end