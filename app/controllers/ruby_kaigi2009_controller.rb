class RubyKaigi2009Controller < ApplicationController
  caches_page :page

  before_filter :specify_locale

  def page
    page_name = params[:page] || "index"
    @page_title = I18n.t(page_name)
    render :template => "ruby_kaigi2009/#{page_name}_#{I18n.locale}"
  end

  private
  def specify_locale
    availables = %{ja en}
    I18n.locale = params[:locale] || request.compatible_language_from(availables)
  end

end
