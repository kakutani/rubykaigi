module PaypalSpecHelper
  def valid_called_back_params
    val = HashWithIndifferentAccess.new
    v = Factory.attributes_for(:sandbox_ipn)
    val.merge(v[:notified_json])
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
