When(/RubyKaigi(\d{4})の"(\w+)"にアクセスする/)do |year, page|
  path = [year, path_to(page)].compact.join("/")
  visit "/#{path}"
end

When /^"(.+)"にアクセスする/ do |page_name|
  visit path_to(page_name)
end

Then /^"(.+)"へのリダイレクトである/ do |location|
  response["Location"].should == location
end
