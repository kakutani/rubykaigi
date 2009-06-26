class LightningTalkSelection < ActiveRecord::Base
  Result = Struct.new(:initial, :rejected, :day1_2009, :day2_2009).new(
    -1, 0, 20090717, 20090718).freeze

  belongs_to :lightning_talk_submission

  validates_presence_of :result
end
