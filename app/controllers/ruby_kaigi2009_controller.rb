class RubyKaigi2009Controller < ApplicationController
  caches_page :page

  before_filter :specify_locale

  def page
    render :template => "ruby_kaigi2009/index"
  end

  private
  def specify_locale
    availables = %{ja en}
    I18n.locale = params[:locale] || request.compatible_language_from(availables)
  end

end
