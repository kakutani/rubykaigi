require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ExchangeTicketsController do
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

  describe "POST 'reissue'" do
    before do
      stub(PaypalTransaction).find_all_by_payer_email { [] }
    end
    it "should be successful" do
      post 'reissue', :email => 'kakutani@rubykaigi.org'
      response.should be_success
    end
  end

  describe "GET 'reissue'" do
    it "should be successful" do
      get 'reissue'
      response.should redirect_to(:action => "index")
    end
  end

end
