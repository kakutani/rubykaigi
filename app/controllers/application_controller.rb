require 'authenticated_system'
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
#  helper :all # include all helpers, all the time
  include AuthenticatedSystem

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'fee0b697461c79843a3833b6d7754c04'

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  # filter_parameter_logging :password


  def basic_auth_required_by_admin
    authenticate_or_request_with_http_basic("restricted ared: username is rubykaigi, password is itsumono.") do |username, password|
      username == configatron.basic_auth.admin.username &&
        password == configatron.basic_auth.admin.password
    end
  end

  def basic_auth_required_by_sponsor
    authenticate_or_request_with_http_basic("restricted ared: sonsors only.") do |username, password|
      username == configatron.basic_auth.sponsor.username &&
        password == configatron.basic_auth.sponsor.password
    end
  end

  def basic_auth_required_by_speaker
    authenticate_or_request_with_http_basic("restricted ared: speakerss only.") do |username, password|
      username == configatron.basic_auth.speaker.username &&
        password == configatron.basic_auth.speaker.password
    end
  end

  def registration_open_at
    @registration_open_at = Time.parse(configatron.paypal.open_at)
  end

  def registration_open?(now = Time.now)
    registration_open_at <= now
  end

  def lt_submission_close_at
    Time.parse(configatron.lt_submission.close_at)
  end

  def lt_submission_open?(now = Time.now)
    lt_submission_close_at >= now
  end
end
