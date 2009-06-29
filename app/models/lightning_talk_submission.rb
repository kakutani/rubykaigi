class LightningTalkSubmission < ActiveRecord::Base
  RubyKaigi2009 = Struct.new(:day1, :day2).new('2009-07-17', '2009-07-18')

  has_one :lightning_talk_selection, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :title
  validates_presence_of :abstract
  validates_presence_of :lightning_talk_selection
  validates_acceptance_of :the_birthstone_of_july, :accept => 'ruby', :message => I18n.t('lt.is_ruby')

  validates_associated :lightning_talk_selection

  def before_validation_on_create
    build_lightning_talk_selection(
      :result => LightningTalkSelection::Result.initial)
  end

  def selection
    lightning_talk_selection
  end
end
