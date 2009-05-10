require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RegistrationsController do
  describe "route generation" do
    it "maps #index" do
      route_for(
        :controller => "registrations", :action => "index",
        :locale => 'en', :year => '2009').should == "/2009/en/registrations"
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/2009/en/registrations").should == {
        :controller => "registrations", :action => "index",
        :locale => 'en', :year => '2009'
      }
    end
  end
end
