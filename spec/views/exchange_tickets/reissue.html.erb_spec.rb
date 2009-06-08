require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/exchange_tickets/reissue" do
  before(:each) do
    assigns[:email] = @email = 'kakutani@rubykaigi.org'
    render 'exchange_tickets/reissue'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('h2', %r[Exchange Ticket\(s\) has been Reissued.])
  end
end
