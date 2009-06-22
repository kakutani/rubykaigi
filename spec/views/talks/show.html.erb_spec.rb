require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/talks/show.html.erb" do
  include TalksHelper
  before(:each) do
    assigns[:talk] = @talk = Talk.new
  end

  it "renders attributes in <p>" do
    render
  end
end
