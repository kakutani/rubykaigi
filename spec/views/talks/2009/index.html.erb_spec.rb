require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe "/talks/2009/index_ja.html.erb" do
  include TalksHelper

  before { render }
  subject { template }
  it { should_not be_nil }
end
