def translate_page(page)
  page == "トップページ" ? "" : page
end

When(/RubyKaigi(\d{4})の"(\w+)"にアクセスする/)do |year, page|
  path = [year, translate_page(page)].compact.join("/")
  visit "/#{path}"
end

