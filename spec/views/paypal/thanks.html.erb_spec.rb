require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/paypal/thanks" do

  context "en" do
    before do
      I18n.locale = 'en'
      assigns[:notified_transaction_id] = '1234356709ABCDEF!'
      render 'paypal/thanks'
    end
    subject { response }
    it { should have_tag('h3', 'Thank you for your registration.') }
  end

  context "ja" do
    before do
      I18n.locale = 'ja'
      assigns[:notified_transaction_id] = '1234356709ABCDEF!'
      render 'paypal/thanks'
    end
    subject { response }
    it { should have_tag('h3', '登録ありがとうございます。') }
  end
end
