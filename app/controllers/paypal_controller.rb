require 'net/https'
Net::HTTP.version_1_2

class PaypalController < ApplicationController
  before_filter :configure_ruby_kaigi_year
  skip_before_filter :verify_authenticity_token

  layout "ruby_kaigi2009"

  def index
    redirect_to(root_path)
  end

  def thanks
  end

  def cancelled
  end

  def sold_out
  end

  def instant_payment_notification
    render :nothing => true
  end

  def payment_data_transfer
    render :nothing => true
  end

  private
  def configure_ruby_kaigi_year
    @year = 2009
  end
end
