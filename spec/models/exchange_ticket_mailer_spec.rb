# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ExchangeTicketMailer do
  before(:all) do
    @ticket = Factory.build(:rk09c_student_exchange_ticket)
    @expected = @ticket.attributes
    @email = ExchangeTicketMailer.create_confirmation(@ticket)
  end
  subject { @email }
  it { should deliver_to("kakutani@rubykaigi.org") }
  it { should have_header("from", "RubyKaigi2009 <2009@rubykaigi.org>") }
  it { should have_subject("RubyKaigi2009(Conference): Exchange Ticket notification") }
  it { should have_text(%r|http://.+/exchange_tickets/show/#{@expected['code4u']}|) }
  it { should have_text(%r|Item Name\s+: RubyKaigi2009\(Conference\)|) }
  it { should have_text(%r|Transaction ID\s+: #{@ticket.txn_id}|) }
  it { should have_text(%r|Last Name\s+: #{@ticket.last_name}|) }
  it { should have_text(%r|First Name\s+: #{@ticket.first_name}|) }
  it { should have_text(%r|E-mail\s+: #{@ticket.email}|) }
  it { should have_text(%r|Verify\s+: #{@ticket.verify}|) }
  it { should have_text(%r|Memo\s+: #{@ticket.memo}|) }
end
