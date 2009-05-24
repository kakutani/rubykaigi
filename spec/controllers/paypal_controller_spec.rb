require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PaypalController do

  #Delete these examples and add some real ones
  it "should use PaypalController" do
    controller.should be_an_instance_of(PaypalController)
  end


  describe "GET 'thanks'" do
    it "should be successful" do
      get 'thanks'
      response.should be_success
    end
  end

  describe "GET 'cancelled'" do
    it "should be successful" do
      get 'cancelled'
      response.should be_success
    end
  end

  describe "GET 'sold_out'" do
    it "should be successful" do
      get 'sold_out'
      response.should be_success
    end
  end

  describe "GET 'instant_payment_notification'" do
    it "should be successful" do
      get 'instant_payment_notification'
      response.should be_success
    end
  end

  describe "GET 'payment_data_transfer'" do
    it "should be successful" do
      get 'payment_data_transfer'
      response.should be_success
    end
  end
end
