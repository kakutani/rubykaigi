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
    add_notice("You have been signed out.", :fade => true)
    redirect_back_or_default('/')
  end

  private
  # Track failed login attempts
  def note_failed_signin
    add_error("Couldn't sign in via '#{session[:openid_identifier]}'")
    logger.warn "Failed signin for '#{session[:openid_identifier]}' from #{request.remote_ip} at #{Time.now.utc}"
  end

  def open_id_authentication
    authenticate_with_open_id do |result, identity_url|
      unless result.successful?
        session[:openid_identifier] = identity_url
        note_failed_signin
        redirect_back_or_default(signin_path)
        return
      end
      account = (Account.find_by_identity_url(identity_url) rescue nil)
      if account
        self.current_user = account
        add_notice("Sign in successfully", :fade => true)
        redirect_back_or_default('/')
        return
      end
      # success but account doesn't exist
      add_notice("Create new account", :fade => true)
      session[:openid_identifier] = identity_url
      redirect_to new_account_path
    end
  end
end
