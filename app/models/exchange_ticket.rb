require 'securerandom'
class ExchangeTicket < ActiveRecord::Base
  belongs_to :paypal_transaction, :readonly => true

  validates_uniqueness_of :code4u

  [:txn_id, :last_name, :first_name, :memo, :verify].each do |sym|
    delegate sym, :to => :paypal_transaction
  end

  class << self
    def generate_ticket_code
      SecureRandom.hex(12)
    end
  end

  before_create do |ticket|
    ticket.code4u = ExchangeTicket.generate_ticket_code
  end

  def receipt_id
    unless (recepit_id_label = paypal_transaction.receipt_id).blank?
      recepit_id_label
    else
      "N/A"
    end
  end

  def item_name
    case paypal_transaction.item_number
    when "rk09c"
      "RubyKaigi2009(Conference)"
    when "rk09p"
      "RubyKaigi2009(Party)"
    else
      "N/A"
    end
  end

  def email
    paypal_transaction.payer_email
  end

  def deliver_confirmation_email
    ExchangeTicketMailer.deliver_confirmation(self)
  end

  def reissue
    update_attribute(:code4u, ExchangeTicket.generate_ticket_code)
    deliver_confirmation_email
  end

end
