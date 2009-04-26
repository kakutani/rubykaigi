# -*- coding: utf-8 -*-
module LanguageHelpers
  def langs_of(name)
    case name
    when /日本語/
      "ja-JP"
    when /英語/
      "en-US"
    else
      name
    end
  end
end

# World do |world|
#   world.extend LanguageHelpers
#   world
# end
World(LanguageHelpers)
