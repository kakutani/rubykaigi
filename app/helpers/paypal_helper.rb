module PaypalHelper
  def item_number_label(paypal)
    case paypal.item_number
    when "rk09c"
      "RubyKaigi2009(Conference)"
    when "rk09p"
      "RubyKaigi2009(Party)"
    end
  end

  def receipt_id_label(paypal)
    receipt_id = paypal.receipt_id
    return "N/A" if receipt_id.blank?
    receipt_id
  end
end
