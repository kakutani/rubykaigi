module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #
  def path_to(page_name)
    case page_name
    when /トップページ/
      ""
    when /^(200[678])$/
      "/#{$1}"
    when /サインイン/
      signin_path
    when /新規アカウント作成/
      new_account_path
    else
      page_name
    end
  end
end

World(NavigationHelpers)
