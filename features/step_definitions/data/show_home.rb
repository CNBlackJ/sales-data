Then(/^我将看到主页有以下内容:$/) do |table|
  # table is a table.hashes.keys # => [:name, :redirect_url]
  table.hashes.each do |row|
    page.find_by_id(row[:id]).should have_content row[:name]
    page.find_by_id(row[:id]).find("a")['href'].should eql? row[:url]
  end

end