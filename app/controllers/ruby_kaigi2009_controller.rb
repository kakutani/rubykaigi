class RubyKaigi2009Controller < ApplicationController
  caches_page :page

  def index
  end

  def page
    render :template => "ruby_kaigi2009/index"
  end
end
