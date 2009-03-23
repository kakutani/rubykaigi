class SessionsController < ApplicationController
  def new
  end

  def create
    redirect_to new_account_path
  end

  def destroy
  end

end
