# coding: utf-8
class PublicReleasesController < LocaleBaseController
  skip_before_filter :login_required
  before_filter :readonly
  before_filter :page_name_is_valid
  before_filter :redirect_to_past_kaigi

  layout proc{|c| "ruby_kaigi#{c.params[:year]}" }

  def show
    # params[:page_name] pass white list at `page_name_is_valid'
    render :template => "ruby_kaigi2009/#{params[:page_name]}_#{I18n.locale}"
  end

  private
  def readonly
    raise MethodNotAllowd unless request.get?
  end

  def page_name_is_valid
    head(:not_found) unless /\A[A-Za-z_\-]*\Z/ =~ params[:page_name]
  end

  def redirect_to_past_kaigi
    if (past = params[:year].to_i) < 2009
      redirect_to "http://jp.rubyist.net/RubyKaigi#{past}"
    end
  end
end
