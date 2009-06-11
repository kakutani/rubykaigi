require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Admin::LightningTalkSubmissionsController do
  before do
    stub(controller).basic_auth_required_by_admin { true }
  end

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
end
