require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/talks/new.html.erb" do
  include TalksHelper
  
  before(:each) do
    assigns[:talk] = stub_model(Talk,
      :new_record? => true
    )
  end

  it "renders new talk form" do
    render
    
    response.should have_tag("form[action=?][method=post]", talks_path) do
    end
  end
end


