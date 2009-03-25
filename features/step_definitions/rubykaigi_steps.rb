# -*- coding: utf-8 -*-
Before do

end

前提 /^アカウント"(.+)"が存在する/ do |factory_name|
  identity_url = Factory.attributes_for(factory_name.to_sym)[:identity_url]
  a = Account.find_by_identity_url(identity_url)
  unless a
    Factory.create(factory_name.to_sym)
  end
end

前提 /^アカウント"(.+)"は存在しない/ do |factory_name|
  account = Account.find_by_identity_url(Factory.attributes_for(factory_name.to_sym)[:identity_url])
  account.destroy if account
end

When(/RubyKaigi(\d{4})の"(\w+)"にアクセスする/)do |year, page|
  path = [year, path_to(page)].compact.join("/")
  visit "/#{path}"
end
