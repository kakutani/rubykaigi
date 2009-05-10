require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RegistrationsController do
  before do
    stub(@controller).assign_locale { true }
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index', :year => "2009", :lang => "en"
      response.should be_success
    end

    it "should be successful" do
      get 'index', :year => "2009", :lang => "ja"
      response.should be_success
    end

  end
end
