require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TalksController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "talks", :action => "index").should == "/talks"
    end

    it "maps #show" do
      route_for(:controller => "talks", :action => "show", :id => "1", :year => "2009", :locale => "en").should == "/2009/en/talks/1"
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/talks").should == {:controller => "talks", :action => "index"}
    end

    it "generates params for #show" do
      params_from(:get, "/2009/ja/talks/1").should == {:year => "2009", :locale => "ja", :controller => "talks", :action => "show", :id => "1"}
    end
  end
end
