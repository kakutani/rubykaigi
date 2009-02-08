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
    availables = %w{ja en}
    preferred = request.preferred_language_from(availables)
    compatible = request.compatible_language_from(availables)
    I18n.locale = params[:locale] || preferred || compatible
  end

end
