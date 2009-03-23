class SessionsController < ApplicationController
  def new
    @openid_identifier = ""
  end

  def create
    logout_keeping_session!
    open_id_authentication
  end

  def destroy
    logout_killing_session!
    flash[:notice] = "You have been signed out."
    redirect_back_or_default('/')
  end

  private
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Couldn't sign you via '#{params[:openid_identifier]}'"
    logger.warn "Failed login for '#{params[:login]}' from #{request.remote_ip} at #{Time.now.utc}"
  end

  def open_id_authentication
    authenticate_with_open_id do |result, identity_url|
      unless result.successful?
        note_failed_signin
        @openid_identifier = identity_url
        redirect_back_or_default('/')
        return
      end
      account = (User.find_by_identity_url(identity_url) rescue nil)
      if account
        self.current_user = user
        redirect_back_or_default('/')
        flash[:notice] = _("Logged in successfully")
        return
      end
      # success but account doesn't exist
      logger.info("##################### #{identity_url}")
      session[:openid_identifier] = identity_url
      redirect_to new_account_path
    end
  end
end
