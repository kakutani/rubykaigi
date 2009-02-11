# Commonly used webrat steps
# http://github.com/brynary/webrat

sel = %q|"([^"]*)"|

def response_body_text(source = response.body)
  Nokogiri::HTML(source).text
end

When /言語は"(.*)"/ do |lang|
  header("ACCEPT_LANGUAGE", lang)
end

When /^"(.*)"ボタンをクリックする$/ do |button|
  click_button(button)
end

When(/^"([^"]*)"リンクをクリックする$/)do |link|
  click_link(link)
end

When /^"(.*)"中の"(.*)"リンクをクリックする$/ do |selector, link|
  click_link_within(selector, link)
end

When(/^テーブル#{sel}の"(\d+)"行目の#{sel}リンクをクリックする/) do |cls, nth, link|
  selector = "table.#{cls} tbody tr:nth(#{nth})"
  click_link_within(selector, link)
end

When /再読み込みする/ do
  visit request.request_uri
end

When /^"(.*)"に"(.*)"と入力する$/ do |field, value|
  fill_in(field, :with => value)
end

# opposite order from Engilsh one(original)
When /^"(.*?)"から"(.*?)"を選択する$/ do |field, value|
  select(value, :from => field)
end

When /^"(.*)"をチェックする$/ do |field|
  check(field)
end

When /^"(.*)"のチェックを外す$/ do |field|
  uncheck(field)
end

When /^#{sel}を選択する$/ do |field|
  choose(field)
end

# opposite order from Engilsh one(original)
When /^"(.*)"としてファイル"(.*)"を添付する$/ do |field, path|
  attach_file(field, path)
end

Then /^"(.*)"と表示されていること$/ do |text|
  response_body_text.should =~ /#{Regexp.escape(text)}/m
end

Then /^"(.*)"と表示されていないこと$/ do |text|
  response_body_text.should_not =~ /#{Regexp.escape(text)}/m
end

Then /^"(.*)"がチェックされていること$/ do |label|
  field_labeled(label).should be_checked
end

Then /^"(.*?)"がリンクになっていないこと$/ do |label|
  Nokogiri::HTML(response.body).search("a").select{|a| a.text == label }.should be_empty
  response_body_text.should =~ /#{Regexp.escape(label)}/m
end

