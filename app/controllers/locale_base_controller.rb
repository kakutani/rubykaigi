# -*- coding: utf-8 -*-
class LocaleBaseController < ApplicationController
  cattr_accessor :language_detector
  self.language_detector = LanguageDetector.new(%w[en ja]).freeze

  before_filter :assign_locale

  def assign_locale
    if params[:locale]
      I18n.locale = params[:locale]
    else
      preferred = request.user_preferred_languages
      pars = params.slice(:controller, :action, :year, :page_name)

      redirect_to(pars.merge(:locale => language_detector.detect(preferred)))
    end
  end

end
