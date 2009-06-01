require File.expand_path('../../spec_helper', File.dirname(__FILE__))

module Paypal
  describe IPNVerifier do
    include PaypalSpecHelper

    before(:all) do
      @ipn_verifier = Paypal::IPNVerifier.new
    end
    # 実装のテスト
    it { @ipn_verifier.send(:postback_host).should == "www.sandbox.paypal.com" } # productionでは www.paypal.com
    it { @ipn_verifier.send(:postback_request_uri).should == "/cgi-bin/webscr" }

    describe "#https_postback" do
      context "when verified" do
        before(:all) do
          @valid_params = valid_called_back_params
          @postback_result = @ipn_verifier.https_postback(@valid_params)
          @postback_params = @ipn_verifier.send(:postback_params).dup
        end

        subject { @ipn_verifier }
        it { should be_verified }
        it { should_not be_invalid }

        # 以下、実装のテスト
        it { @postback_result.should == "VERIFIED" }
        it { @postback_params["cmd"].should == "_notify-validate" }

        specify "cmdだけが追加されていること" do
          @postback_params.delete("cmd")
          @postback_params.should == @valid_params
        end
      end

      context "when invalid" do
        before(:all) do
          @postback_result = @ipn_verifier.https_postback(invalid_called_back_params)
        end
        subject { @ipn_verifier }
        it { should_not be_verified }
        it { should be_invalid }
      end
    end
  end
end
