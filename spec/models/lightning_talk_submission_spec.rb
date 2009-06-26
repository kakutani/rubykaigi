# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LightningTalkSubmission do
  describe "#create" do
    subject do
      LightningTalkSubmission.create(
        :name => 'john smith',
        :email => 'john@example.com',
        :title => 'my talk',
        :abstract => 'too much abstract'
        )
    end

    after do
      subject.destroy
    end

    it { should be_valid }
    it { subject.lightning_talk_selection.result.should == "NOTYET" }

  end
end
