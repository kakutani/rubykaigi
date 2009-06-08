# -*- coding: utf-8 -*-
class ExchangeTicketMailer < ActionMailer::Base
  def confirmation(exchange_ticket)
    subject    "#{exchange_ticket.item_name}: Exchange Ticket notification"
    recipients exchange_ticket.email
    from       "RubyKaigi2009 <2009@rubykaigi.org>"
    sent_on    sent_at
    body       :ticket => exchange_ticket
  end

  private
  def sent_at
    Time.now
  end
end
