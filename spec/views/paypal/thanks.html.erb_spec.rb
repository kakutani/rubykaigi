require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/paypal/thanks" do
  before(:each) do
    stub(@paypal = PaypalTransaction.new) {
      item_number { 'rk09c' }
      txn_id { '1234567890ABCDEFG' }
      receipt_id { '1111-2222-3333-4444' }
      last_name { 'Kakutani' }
      first_name { 'Shintaro' }
      payer_email { 'kakutani@rubykaigi.org' }
      verify { 'VERIFIED' }
    }
    assigns[:paypal] = @paypal
    pending
    render 'paypal/thanks'
  end

  it "should show thank you" do
    response.should have_tag('h3', "Thank you for your registration.")
  end

  it "should show exchange ticket" do
    response.should have_tag('h4', 'Exchange Ticket')
  end

end
