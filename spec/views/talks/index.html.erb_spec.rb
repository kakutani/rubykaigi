require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/talks/2009" do
  include TalksHelper

  describe "/talks/2009/index_ja.html.erb" do
    before { render }
    subject { template }
    it { should_not be_nil }
  end

  describe "/talks/2009/index_en.html.erb" do
    before { render }
    subject { template }
    it { should_not be_nil }
  end
end
