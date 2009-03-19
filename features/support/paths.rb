module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /トップページ/
      ""
    when /^(200[678])$/
      "/#{$1}"
    # Add more page name => path mappings here
    else
      page_name
    end
  end
end

World do |world|
  world.extend NavigationHelpers
  world
end
