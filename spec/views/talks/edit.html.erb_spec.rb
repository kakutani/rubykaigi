require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/talks/edit.html.erb" do
  include TalksHelper
  
  before(:each) do
    assigns[:talk] = @talk = stub_model(Talk,
      :new_record? => false
    )
  end

  it "renders the edit talk form" do
    render
    
    response.should have_tag("form[action=#{talk_path(@talk)}][method=post]") do
    end
  end
end


