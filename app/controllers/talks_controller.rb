class TalksController < LocaleBaseController
  layout proc{|c| "ruby_kaigi#{c.params[:year]}" }

  before_filter :basic_auth_required_by_speaker

  def index
  end

  def show
    @talk = Talk.year(params[:year]).find(params[:id])
  end

end
