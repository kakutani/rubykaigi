require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe "/talks/2009/show.html.erb" do
  include TalksHelper
  before(:each) do
    stub(template).render_hikidoc { "" }
    stub(template).talks_path { "/" }
    assigns[:talk] = @talk = Talk.new
    stub(@talk) {
      title { "t" }
      speaker { "s" }
      profile { "p" }
      abstract { "a" }
      start_at { Time.now }
    }
  end

  it "renders attributes in <p>" do
    render
  end
end
