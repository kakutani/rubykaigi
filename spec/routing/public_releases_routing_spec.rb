require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PublicReleasesController do
  describe "route generation" do
    it "should map #show with locale" do
      route_for(:controller => "public_releases", :action => "show",
                :page_name => "index", :locale => "ja", :year=> "2009").should == "/2009/ja"
    end

    it "should map #show with locale" do
      route_for(:controller => "public_releases", :action => "show",
                :page_name => "index", :locale => "en", :year=> "2009").should == "/2009/en"
    end

    it "should map #show without locale" do
      route_for(:controller => "public_releases", :action => "show",
                :page_name => "index", :year=> "2009").should == "/2009"
    end
  end

  describe "route recognition" do
    before{ @base = {:controller => "public_releases", :action => "show", :year => "2009"}.freeze }
    it "should generate params for '/2009/ja'" do
      params_from(:get, "/2009/ja/").should ==
        @base.merge(:locale => "ja", :page_name => "index")
    end

    it "should generate params for '/2009/ja/cfp'" do
      params_from(:get, "/2009/ja/cfp").should ==
        @base.merge(:locale => "ja", :page_name => "cfp")
    end

    it "should generate params for '/2009'" do
      params_from(:get, "/2009").should == @base.merge(:page_name => "index")
    end

    it "should generate params for '/2009/en'" do
      params_from(:get, "/2009/en").should ==
        @base.merge(:locale => "en", :page_name => "index")
    end

    it "should generate params for '/2009/en/CallForSponcers'" do
      params_from(:get, "/2009/en/CallForSponcers").should ==
        @base.merge(:locale => "en", :page_name => "CallForSponcers")
    end
  end
end
