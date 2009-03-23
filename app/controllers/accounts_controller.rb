class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(:identity_url =>  session[:openid_identifier])
    @account.save!
    redirect_to root_path
  end

end
