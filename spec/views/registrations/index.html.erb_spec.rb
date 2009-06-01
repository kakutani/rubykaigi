require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/registrations/index" do
  before(:each) do
    stub(template).render_paypal_buynow_form { "buy now" }
    render :template => 'registrations/2009/index_en'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should contain(/Registration/)
  end
end
