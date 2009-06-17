class TalksController < LocaleBaseController
  layout proc{|c| "ruby_kaigi#{c.params[:year]}" }
  
  def index
    @talks = Talk.all
  end

  def show
    @talk = Talk.year(params[:year]).find(params[:id])
  end

end
