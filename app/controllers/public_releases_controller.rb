class PublicReleasesController < ApplicationController
  skip_before_filter :login_required
  before_filter :readonly
  before_filter :page_name_is_valid
  before_filter :assign_locale

  layout proc{|c| "ruby_kaigi#{c.params[:year]}" }

  cattr_accessor :language_detector
  self.language_detector = LanguageDetector.new(%w[en ja]).freeze

  def show
    # params[:page_name] pass white list at `page_name_is_valid'
    logger.debug(I18n.locale)
    render :template => "ruby_kaigi2009/#{params[:page_name]}_#{I18n.locale}"
  end

  private
  def readonly
    raise MethodNotAllowd unless request.get?
  end

  def page_name_is_valid
    head(:not_found) unless /\A[A-Za-z_\-]*\Z/ =~ params[:page_name]
  end

  def assign_locale
    if params[:locale]
      I18n.locale = params[:locale]
    else params[:locale]
      preferred = request.user_preferred_languages
      pars = params.slice(:controller, :action, :year, :page_name)

      redirect_to(pars.merge(:locale => language_detector.detect(preferred)))
    end
  end
end
