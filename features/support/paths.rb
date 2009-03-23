# -*- coding: utf-8 -*-
module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /トップページ/
      ""
    when /^(200[678])$/
      "/#{$1}"
    when /ログイン/
      login_path
    when /新規アカウント作成/
      new_account_path
    else
      page_name
    end
  end
end

World do |world|
  world.extend NavigationHelpers
  world
end
