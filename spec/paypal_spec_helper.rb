module PaypalSpecHelper
  def valid_called_back_params
    val = HashWithIndifferentAccess.new
    val.merge({"tax"=>"0", "payment_status"=>"Completed", "insurance_amount"=>"0",
      "receiver_email"=>"shinta_1241708895_biz@gmail.com", "discount"=>"0.0",
      "business"=>"shinta_1241708895_biz@gmail.com", "quantity"=>"1",
      "receiver_id"=>"K2HGL4QJKAY2U", "transaction_subject"=>"RubyKaigi2009",
      "payment_gross"=>"", "notify_version"=>"2.8", "payment_fee"=>"",
      "mc_currency"=>"JPY", "verify_sign"=>"AQU0e5vuZCvSg-XJploSa.sGUDlpAxRfHwadbzPabWofTMdNegu1l2rF",
      "txn_id"=>"1AB90889MD256370X", "item_name"=>"RubyKaigi2009", "shipping"=>"0",
      "txn_type"=>"web_accept", "test_ipn"=>"1", "mc_gross"=>"6000", "payer_id"=>"BS86HDBBHX4MW",
      "charset"=>"UTF-8", "mc_fee"=>"214", "last_name"=>"User", "shipping_discount"=>"0",
      "custom"=>"", "payer_status"=>"verified", "protection_eligibility"=>"Ineligible",
      "payment_date"=>"18:25:17 May 23, 2009 PDT", "payer_email"=>"shinta_1241709003_per@gmail.com",
      "residence_country"=>"US", "handling_amount"=>"0", "shipping_method"=>"Default", "first_name"=>"Test",
      "payment_type"=>"instant", "btn_id"=>"40169", "item_number"=>"rk09c"})
  end

  def invalid_called_back_params
    valid_called_back_params.merge("txn_id" => "INVALID_TXN_ID")
  end

  def valid_return_params
    val = HashWithIndifferentAccess.new
    val.merge({
        "cc"=>"JPY", "st"=>"Completed", "tx"=>"1AB90889MD256370X",
        "sig"=>"deO16VDFHrtUQQ3pdVW8+d2wNjVZhs0CDHVoxZ/OOlG8l9KqGPYni9Rye17daZmBa3bZ4+46RBGrbdWCXcnLxg0WStIc8QqXbok81giYb8Zt834WbPzUbFrESxLuH5MBvzww51G58GFLqHbQwGIkprA/7fAtXLAa+EEysD2ypII=",
        "amt"=>"6000", "cm"=>"", "item_number"=>"rk09c"})
  end
end
