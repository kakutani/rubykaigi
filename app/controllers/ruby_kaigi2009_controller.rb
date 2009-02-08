class RubyKaigi2009Controller < ApplicationController
  caches_page :page

  before_filter :specify_locale

  def index
    redirect_to "/2009/#{I18n.locale}"
  end

  def page
    page_name = params[:page] || "index"
    render :template => "ruby_kaigi2009/#{page_name}_#{I18n.locale}"
  end

  private
  def specify_locale
    availables = %w{ja en}
    logger.debug("preferred_languages: #{request.user_preferred_languages.join(',')}")
    preferred = request.preferred_language_from(availables)
    compatible = request.compatible_language_from(availables)
    logger.debug("preferred: #{preferred}, compatible: #{compatible}")
    I18n.locale = params[:locale] || preferred || compatible
  end

end
