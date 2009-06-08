require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ExchangeTicketsController do
  describe "route generation" do
    it "should map #show with code4u" do
      route_for(:controller => "exchange_tickets", :action => "show",
                :code4u => "cc532e25c8012cbbe26f803e").
        should == "/exchange_tickets/show/cc532e25c8012cbbe26f803e"
    end

    it "should map #reissue" do
      route_for(:controller => "exchange_tickets", :action => "reissue").
        should == "/exchange_tickets/reissue"
    end

    it "should map #index" do
      route_for(:controller => "exchange_tickets", :action => "index"
        ).should == "/exchange_tickets/"
    end
  end

  describe "route recognition" do
    it "should generate params for #show" do
      params_from(:get, "/exchange_tickets/show/cc532e25c8012cbbe26f803e").
        should == {:controller => 'exchange_tickets', :action => 'show',
        :code4u => 'cc532e25c8012cbbe26f803e'}
    end

    it "should generate #index" do
      params_from(:get, "/exchange_tickets").should ==
        {:controller => 'exchange_tickets', :action => 'index'}
    end

    it "should generate #reissue" do
      params_from(:post, "/exchange_tickets/reissue").should ==
        {:controller => 'exchange_tickets', :action => 'reissue'}
    end
  end
end
