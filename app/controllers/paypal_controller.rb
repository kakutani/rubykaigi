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
    else
      @notified_transaction_id = params[:tx]
    end
  end

  def cancelled
  end

  def sold_out
  end

  def instant_payment_notification
    begin
      @paypal = PaypalTransaction.find_by_txn_id(params[:txn_id])
      if @paypal
        logger.info("txn_id is already taken #{@paypal.txn_id}")
        render :nothing => true, :status => 200
      end
      @paypal = PaypalTransaction.create_for_verify_later!(params)
      if @paypal.validate_transaction
        @paypal.notify_exchange_ticket_information_to_payer
      else
        logger.error("PaypalTransaction was invalid: '#{@paypal.txn_id}'")
      end
      render :nothing => true, :status => 200
    rescue => e
      logger.error("Something wrong with processing PaypalTransaction: '#{@paypal.txn_id}'")
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
