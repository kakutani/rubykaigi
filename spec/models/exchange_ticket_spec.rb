require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ExchangeTicket do
  describe "w/o paypal account" do
    before do
      @ticket = ExchangeTicket.new
      @ticket.paypal_transaction = Factory.build(:rk09c_student_transaction)
      @expected = HashWithIndifferentAccess.new.merge(@ticket.paypal_transaction.attributes)
    end
    it { @ticket.txn_id.should == @expected[:txn_id] }
    it { @ticket.receipt_id.should == @expected[:receipt_id] }
    it { @ticket.item_name.should == "RubyKaigi2009(Conference)" }
    it { @ticket.email.should == @expected[:payer_email] }
    it { @ticket.last_name.should == @expected[:last_name] }
    it { @ticket.first_name.should == @expected[:first_name] }
    it { @ticket.memo.should == @expected[:memo] }
    it { @ticket.verify.should == @expected[:verify] }
  end
end

describe ExchangeTicket, "#code4u" do
  before do
    @ticket = ExchangeTicket.create!(:paypal_transaction_id => 9999)
  end
  it { @ticket.code4u.size.should == 24 }
  it { @ticket.code4u.should be_instance_of(String) }
end

describe ExchangeTicket, "#item_name" do
  context "when rk09c" do
    before do
      stub(@paypal = PaypalTransaction.new).item_number { "rk09c" }
      @ticket = ExchangeTicket.new
      @ticket.paypal_transaction = @paypal
    end
    subject { @ticket.item_name }
    it { should == "RubyKaigi2009(Conference)" }
  end
  context "when rk09p" do
    before do
      stub(@paypal = PaypalTransaction.new).item_number { "rk09p" }
      @ticket = ExchangeTicket.new
      @ticket.paypal_transaction = @paypal
    end
    subject { @ticket.item_name }
    it { should == "RubyKaigi2009(Party)" }
  end
end

describe ExchangeTicket, "#receipt_id" do
  context "when not blank" do
    before do
      stub(@paypal = PaypalTransaction.new).receipt_id { "1111-2222-3333-4444" }
      @ticket = ExchangeTicket.new
      @ticket.paypal_transaction = @paypal
    end
    subject { @ticket.receipt_id }
    it { should == "1111-2222-3333-4444" }
  end

  context "when blank" do
    before do
      stub(@paypal = PaypalTransaction.new).receipt_id { "" }
      @ticket = ExchangeTicket.new
      @ticket.paypal_transaction = @paypal
    end
    subject { @ticket.receipt_id }
    it { should == "N/A" }
  end
end
