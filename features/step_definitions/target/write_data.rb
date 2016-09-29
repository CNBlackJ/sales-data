When(/^填写以下数据:$/) do |table|
  # table is a table.hashes.keys # => [:element_name, :value]
  table.hashes.each do |row|
    fill_in row[:element_id], :with => row[:value]
  end
end