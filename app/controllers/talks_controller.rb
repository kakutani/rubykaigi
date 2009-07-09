class TalksController < LocaleBaseController
  layout proc{|c| "ruby_kaigi#{c.params[:year]}" }

  def index
    @title = t(:timetable)
    render :template => "#{controller_name}/#{params[:year]}/#{action_name}"
  end

  def show
    @year, code = [params[:year], params[:id]]
    @talk = Talk.year(@year).find_by_code(code)
    respond_to do |wants|
      wants.html do
        render :template => "#{controller_name}/#{@year}/#{action_name}"
      end
      wants.json do
        render :json => @talk.to_json
      end
    end

  end

end
