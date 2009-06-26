require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LightningTalkSelection do
  before(:each) do
    @valid_attributes = {
      :lightning_talk_submission_id => 1,
      :result => "value for result"
    }
  end

  it "should create a new instance given valid attributes" do
    LightningTalkSelection.create!(@valid_attributes)
  end
end
