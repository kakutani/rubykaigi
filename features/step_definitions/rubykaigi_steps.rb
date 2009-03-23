# -*- coding: utf-8 -*-
Before do
  Account.delete_all
end



When(/RubyKaigi(\d{4})の"(\w+)"にアクセスする/)do |year, page|
  path = [year, path_to(page)].compact.join("/")
  visit "/#{path}"
end
