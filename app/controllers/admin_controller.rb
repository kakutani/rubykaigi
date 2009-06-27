class AdminController < ApplicationController
  layout "admin"
  before_filter :basic_auth_required_by_admin
  before_filter :configure_title
  helper :all

  private
  def configure_title
    @title = "Admin"
  end

end
