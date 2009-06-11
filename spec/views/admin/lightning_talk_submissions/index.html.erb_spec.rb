require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe "/admin/lightning_talk_submissions/index" do
  before(:each) do
    assigns[:lightning_talk_submissions] = []
    render 'admin/lightning_talk_submissions/index'
  end

  it "should tell you where to find the file" do
    response.should have_tag('h2', %r[LT応募者一覧])
  end
end
