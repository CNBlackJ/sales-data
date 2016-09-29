And(/^今天是"([^"]*)"$/) do |arg|
  pending
end

And(/^今天是"([^"]*)"年"([^"]*)"月"([^"]*)"日$/) do |year, month, day|
  @year = year
  @month = month
  @day = day
  @date = "%s%s%s" %[year, month, day]
end