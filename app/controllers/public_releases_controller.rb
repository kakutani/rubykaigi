# coding: utf-8
class PublicReleasesController < LocaleBaseController
  skip_before_filter :login_required
  before_filter :readonly
  before_filter :page_name_is_valid
  before_filter :redirect_to_past_kaigi
#  before_filter :sponsors_only

  layout proc{|c| "ruby_kaigi#{c.params[:year]}" }

  def show
    # params[:page_name] pass white list at `page_name_is_valid'
    begin
      @headline_entries = HeadlineEntry.recent
      render :template => "ruby_kaigi2009/#{params[:page_name]}_#{I18n.locale}"
    rescue Errno::ENOENT, ActionView::MissingTemplate => e
      alternative = Dir.glob(Rails.root + "app/views/ruby_kaigi2009/#{params[:page_name]}*").first
      if File.exist? alternative
        alt_locale = alternative.split("_").last.split(".").first
        redirect_to(:action => :show, :year => params[:year], :page_name => params[:page_name], :locale => alt_locale)
      else
        raise e
      end
    end
  end

  private
  def readonly
    raise MethodNotAllowd unless request.get? # FIXME: typo
  end

  def page_name_is_valid
    head(:not_found) unless /\A[A-Za-z_\-]*\Z/ =~ params[:page_name]
  end

  def redirect_to_past_kaigi
    if (past = params[:year].to_i) < 2009
      redirect_to "http://jp.rubyist.net/RubyKaigi#{past}"
    end
  end

  def sponsors_only
    return basic_auth_required_by_sponsor if params[:page_name] == "Sponsors"
    true
  end
end
