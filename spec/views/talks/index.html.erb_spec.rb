require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/talks/index.html.erb" do
  include TalksHelper
  
  before(:each) do
    assigns[:talks] = [
      stub_model(Talk),
      stub_model(Talk)
    ]
  end

  it "renders a list of talks" do
    render
  end
end

