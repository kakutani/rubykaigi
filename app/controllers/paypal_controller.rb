require 'net/https'
Net::HTTP.version_1_2

class PaypalController < ApplicationController
  skip_before_filter :verify_authenticity_token

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
  end

  def payment_data_transfer
  end

end
