# -*- coding: utf-8 -*-
Factory.define :sandbox_ipn, :class => PaypalTransaction do |paypal|
  paypal.txn_id "1AB90889MD256370X"
  paypal.item_number "rk09c"
  paypal.payer_email "shinta_1241709003_per@gmail.com"
  paypal.last_name "User"
  paypal.first_name "Test"
  paypal.payment_status "Completed"
  paypal.residence_country "US"
  paypal.verify "VERIFIED"
  paypal.notified_json { ActiveSupport::JSON.decode(%Q!{"insurance_amount": "0", "payment_status": "Completed", "tax": "0", "discount": "0.0", "receiver_email": "shinta_1241708895_biz@gmail.com", "payment_gross": "", "transaction_subject": "RubyKaigi2009", "receiver_id": "K2HGL4QJKAY2U", "quantity": "1", "business": "shinta_1241708895_biz@gmail.com", "mc_currency": "JPY", "payment_fee": "", "notify_version": "2.8", "shipping": "0", "item_name": "RubyKaigi2009", "txn_id": "1AB90889MD256370X", "verify_sign": "AQU0e5vuZCvSg-XJploSa.sGUDlpAxRfHwadbzPabWofTMdNegu1l2rF", "test_ipn": "1", "txn_type": "web_accept", "shipping_discount": "0", "last_name": "User", "mc_fee": "214", "charset": "UTF-8", "payer_id": "BS86HDBBHX4MW", "mc_gross": "6000", "payer_status": "verified", "custom": "", "shipping_method": "Default", "handling_amount": "0", "residence_country": "US", "payer_email": "shinta_1241709003_per@gmail.com", "payment_date": "18:25:17 May 23, 2009 PDT", "protection_eligibility": "Ineligible", "item_number": "rk09c", "btn_id": "40169", "payment_type": "instant", "first_name": "Test"}!)}
end

Factory.define :sandbox_ticket, :class => ExchangeTicket do |ticket|
  ticket.association :paypal_transaction, :factory => :sandbox_ipn
  ticket.code4u "9493b7c5e8f73e6fccc2aa76"
end

Factory.define :rk09c_member_transaction, :class => PaypalTransaction do |paypal|
  paypal.txn_id { "#{SecureRandom.hex(8)}X" }
  paypal.item_number "rk09c"
  paypal.payment_status "Completed"
  paypal.notified_json '{"dummy":"dummy"}'
  paypal.residence_country "JP"
  paypal.payer_email "kakutani@rubykaigi.org"
  paypal.last_name "kakutani"
  paypal.first_name "shintaro"
  paypal.verify "VERIFIED"
end

Factory.define :rk09c_visitor_transaction, :parent => :rk09c_member_transaction do |paypal|
  paypal.receipt_id "1111-2222-3333-4444"
end

Factory.define :rk09c_student_transaction, :parent => :rk09c_visitor_transaction do |paypal|
  paypal.memo "学生ですとかそーゆうの"
end

Factory.define :rk09c_student_exchange_ticket, :class => ExchangeTicket do |ticket|
  ticket.association :paypal_transaction, :factory => :rk09c_student_transaction
  ticket.code4u "5c050afc0698d3743c418e1d"
end
