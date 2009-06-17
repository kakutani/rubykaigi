require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Talk do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    Talk.create!(@valid_attributes)
  end
end
