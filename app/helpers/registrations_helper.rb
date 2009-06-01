module RegistrationsHelper
  def render_paypal_buynow_form(hosted_button_id, item_sym)
    unless sold_out?(item_sym)
      do_render_paypal_buynow_form(hosted_button_id)
    else
      '<div class="sold_out">SOLD OUT</div>'
    end
  end


  private
  def sold_out?(item_sym)
    flag = case item_sym
    when :rubykaigi2009
      configatron.paypal.soldout.rubykaigi2009.conference
    when :rubykaigi2009party
      configatron.paypal.soldout.rubykaigi2009.party
    end
    !flag.nil? && flag
  end

  def do_render_paypal_buynow_form(hosted_button_id)
    paypal_url = configatron.paypal.base_url
    post_to = "#{paypal_url}/cgi-bin/webscr"
    <<-FORM
<form action="#{post_to}" method="post">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="#{hosted_button_id}">
<input type="hidden" name="charset" value="utf-8">
#{paypal_hidden_lc}
#{paypal_button_img_tag('http://paypal.com')}
<img alt="" border="0" src="#{paypal_url}/en_US/i/scr/pixel.gif" width="1" height="1">
</form>
    FORM
  end

  def paypal_hidden_lc
    if I18n.locale == 'ja'
      '<input type="hidden" name="lc" value="JP">'
    else
      ''
    end
  end

  def paypal_button_img_tag(paypal_url)
    button_url = "#{paypal_url}/en_US#{I18n.locale == 'ja' ? '/JP/' : '/'}i/btn/btn_buynowCC_LG.gif"
    button_label = if I18n.locale == 'ja'
                     "PayPal - オンラインで安全・簡単にお支払い"
                   else
                     "PayPal - The safer, easier way to pay online!"
                   end
    %Q!<input type="image" src="#{button_url}" border="0" name="submit" alt="#{button_label}">!
  end
end
