class RegistrationsController < LocaleBaseController
  before_filter :basic_auth_required_by_admin
  caches_page :index

  layout proc{|c| "ruby_kaigi#{c.params[:year]}" }

  def index
    year = params[:year]
    render :template => "registrations/#{year}/#{action_name}_#{params[:locale]}"
  end
end
