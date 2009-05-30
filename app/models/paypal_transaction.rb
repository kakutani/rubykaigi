require 'paypal/ipn_verifier'
class PaypalTransaction < ActiveRecord::Base
  validates_presence_of :txn_id, :item_number, :payer_email, :last_name, :first_name,
    :payment_status, :residence_country,:verify, :notified_json

  class << self
    def create_for_verify_later!(called_back_params)
      attrs = HashWithIndifferentAccess.new
      [:txn_id, :item_number, :payer_email, :last_name, :first_name,
        :payment_status, :residence_country].each do |sym|
        attrs[sym] = called_back_params[sym]
      end
      attrs[:verify] = "NOTYET"
      attrs[:notified_json] = called_back_params.to_json
      PaypalTransaction.create!(attrs)
    end

  end

  def validate_transaction
    verifier = ::Paypal::IPNVerifier.new
    result = verifier.https_postback(notified_params)
    update_attribute(:verify, result)
    validate_transaction?
  end

  def validate_transaction?
    verify == "VERIFIED"
  end

  def notified_params
    ActiveSupport::JSON.decode(notified_json)
  end

end
