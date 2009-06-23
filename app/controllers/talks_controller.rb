class TalksController < LocaleBaseController
  layout proc{|c| "ruby_kaigi#{c.params[:year]}" }

  def index
    @title = t(:timetable)
    # TODO テンプレートはja/enで共通にする
    render :template => "#{controller_name}/#{params[:year]}/#{action_name}_#{I18n.locale}"
  end

  def show
    @talk = Talk.year(params[:year]).find(params[:id])
  end

end
