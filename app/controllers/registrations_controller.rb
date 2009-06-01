class RegistrationsController < LocaleBaseController
  caches_page :index

  layout proc{|c| "ruby_kaigi#{c.params[:year]}" }

  def index
    year = params[:year]
    render :template => "registrations/#{year}/#{action_name}_#{params[:locale]}"
  end
end
