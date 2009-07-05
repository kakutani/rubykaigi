require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe "/talks/2009/index.html.erb" do
  include TalksHelper

  before do
    stub(template).talk_for do
      stub(talk = Talk.new) {
        title { "t" }
        speaker { "s" }
      }
      [talk, "/"]
    end
    render
  end
  subject { template }
  it { should_not be_nil }
end
