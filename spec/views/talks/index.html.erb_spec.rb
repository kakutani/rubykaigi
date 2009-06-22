require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/talks/index.html.erb" do
  include TalksHelper

  before do
    render
  end

  it { template.should_not be_nil }
end
