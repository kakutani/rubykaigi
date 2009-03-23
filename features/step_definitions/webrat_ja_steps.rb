# -*- coding: utf-8 -*-
# Commonly used webrat steps
# http://github.com/brynary/webrat
support_dir = File.join(File.dirname(__FILE__), "..", "support")
require File.expand_path("paths", support_dir)
require File.expand_path("langs", support_dir)
require File.expand_path("open_id_fake_server", support_dir)

前提 /^"(.+)"にアクセス(?:する)?$/ do |page_name|
  visit path_to(page_name)
end

When /言語は"(.*)"/ do |lang|
  header("ACCEPT_LANGUAGE", langs_of(lang))
end

When /^"(.*)"ボタンをクリックする$/ do |button|
  click_button(button)
end

When(/^"([^"]*)"(?:の)?リンクをクリックする$/)do |link|
  click_link(link)
end

When /^"(.*)"中の"(.*)"リンクをクリックする$/ do |selector, link|
  click_link_within(selector, link)
end

sel = %q|"([^"]*)"| #"
When(/^テーブル#{sel}の"(\d+)"行目の#{sel}リンクをクリックする/) do |cls, nth, link|
  selector = "table.#{cls} tbody tr:nth(#{nth})"
  click_link_within(selector, link)
end

When /再読み込みする/ do
  reload
end

When /^"(.*)"に"(.*)"と入力(?:する)?$/ do |field, value|
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
When /^"(.*)"に"(.*)"を添付する$/ do |field, path|
  attach_file(field, path.to_s)
end

もし /^"(.*)"フォームを送信(?:する)?$/ do |form_id|
  submit_form(form_id)
end

Then /^"(.*)"(?:と|が)表示されていること$/ do |text|
  response.should contain(/#{Regexp.escape(text)}/m)
end

Then /^"(.*)"(?:と|が|は)表示されていないこと$/ do |text|
  response.should_not contain(/#{Regexp.escape(text)}/m)
end

Then /^"(.*)"がチェックされていること$/ do |label|
  field_labeled(label).should be_checked
end

def response_body_text(source = response.body)
  Nokogiri::HTML(source).text
end
Then /^"(.*?)"がリンクになっていないこと$/ do |label|
  Nokogiri::HTML(response.body).search("a").select{|a| a.text == label }.should be_empty
  response_body_text.should =~ /#{Regexp.escape(label)}/m
end

ならば(/^"(.+)"へのリダイレクトであること$/) do |location|
  response["Location"].should match(/#{location}/)
end
