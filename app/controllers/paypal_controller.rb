class PaypalController < ApplicationController
  before_filter :configure_ruby_kaigi_year
  skip_before_filter :verify_authenticity_token
  caches_page :cancelled, :sold_out

  layout "ruby_kaigi2009"

  def index
    redirect_to(root_path)
  end

  def thanks
    if params[:tx].blank?
      redirect_to root_path
      return
    end
    @paypal = PaypalTransaction.find_by_txn_id(params[:tx])
    if !@paypal || !@paypal.validate_transaction
      logger.error "INVALID TRANSACTION: '#{@paypal.txn_id}', #{@paypal.item_number}, #{@paypal.payment_status}, #{@paypal.verify}" if @paypal
      render :template => "paypal/txn_id_was_not_verified"
      return
    end
  end

  def cancelled
  end

  def sold_out
  end

  def instant_payment_notification
    begin
      PaypalTransaction.create_for_verify_later!(params)
      render :nothing => true, :status => 200
    rescue => e
      logger.error(e)
      render :nothing => true, :status => 500
    end
  end

  def payment_data_transfer
    render :nothing => true
  end

  private
  def configure_ruby_kaigi_year
    @year = 2009
  end
end
