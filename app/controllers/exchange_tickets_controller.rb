class ExchangeTicketsController < ApplicationController
  layout "ruby_kaigi2009"
  verify :method => :post, :only => [:reissue], :redirect_to => {:action => :index}

  before_filter :email_required, :only => [:reissue]

  def index
  end

  def show
    @ticket = ExchangeTicket.find_by_code4u(params[:code4u])
    unless @ticket
      render :file => "#{RAILS_ROOT}/public/404.html", :sttus => 404
    end
  end

  def reissue
    tickets = PaypalTransaction.find_all_by_payer_email(@email).
      map(&:exchange_ticket)
    tickets.each do |ticket|
      ticket.reissue
    end
    if tickets.blank?
      logger.warn("Cannot find any PaypalTransaction by payer_email:'#{@email}'")
    end
  end

  private
  def email_required
    @email = params[:email]
    if @email.blank?
      redirect_to :action => "index"
    else
      true
    end
  end
end
