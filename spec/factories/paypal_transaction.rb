Factory.define :sandbox_ipn, :class => PaypalTransaction do |paypal|
  paypal.txn_id "value for txn_id"
  paypal.item_name "value for item_name"
  paypal.payer_email "value for payer_email"
  paypal.last_name "value for last_name"
  paypal.first_name "value for first_name"
  paypal.payment_status "value for payment_status"
  paypal.residence_country "value for residence_country"
  paypal.verify "value for verify"
  paypal.notifed_json "atode"
end
