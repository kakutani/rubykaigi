class LiveController < LocaleBaseController
  layout "ruby_kaigi2009"

  def show
    begin
      render :template => "ruby_kaigi2009/live/#{params[:page_name]}_#{I18n.locale}"
    rescue Errno::ENOENT, ActionView::MissingTemplate => e
      alternative = Dir.glob(Rails.root + "app/views/ruby_kaigi2009/live/#{params[:page_name]}*").first
      if File.exist? alternative
        alt_locale = alternative.split("_").last.split(".").first
        redirect_to(:action => :show, :year => params[:year], :page_name => params[:page_name], :locale => alt_locale)
      else
        raise e
      end
    end
  end
end
