require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RegistrationsController do
  before do
    stub(@controller).assign_locale { true }
    stub(@controller).basic_auth_required_by_admin { true }
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index', :year => "2009", :locale => "en"
      response.should be_success
    end

    it "should be successful" do
      get 'index', :year => "2009", :locale => "ja"
      response.should be_success
    end

  end
end
