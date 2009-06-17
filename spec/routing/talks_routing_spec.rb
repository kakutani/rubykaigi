require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TalksController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "talks", :action => "index").should == "/talks"
    end
  
    it "maps #new" do
      route_for(:controller => "talks", :action => "new").should == "/talks/new"
    end
  
    it "maps #show" do
      route_for(:controller => "talks", :action => "show", :id => "1").should == "/talks/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "talks", :action => "edit", :id => "1").should == "/talks/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "talks", :action => "create").should == {:path => "/talks", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "talks", :action => "update", :id => "1").should == {:path =>"/talks/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "talks", :action => "destroy", :id => "1").should == {:path =>"/talks/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/talks").should == {:controller => "talks", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/talks/new").should == {:controller => "talks", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/talks").should == {:controller => "talks", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/talks/1").should == {:controller => "talks", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/talks/1/edit").should == {:controller => "talks", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/talks/1").should == {:controller => "talks", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/talks/1").should == {:controller => "talks", :action => "destroy", :id => "1"}
    end
  end
end
