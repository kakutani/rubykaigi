require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PaypalTransaction do
  include PaypalSpecHelper

  describe ".create_for_verify_later!" do
    before do
      @called_back = valid_called_back_params
      @subject = PaypalTransaction.create_for_verify_later!(@called_back)
    end

    it { should_not be_nil }
    it { should be_valid }
    it { subject.verify.should == "NOTYET"}
    it { subject.notified_params.should  == @called_back }
  end
end
