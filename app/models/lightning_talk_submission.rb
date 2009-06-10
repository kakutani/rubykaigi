class LightningTalkSubmission < ActiveRecord::Base
  RubyKaigi2009 = Struct.new(:day1, :day2).new('7/17', '7/18')

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :title
  validates_presence_of :abstract
  validates_acceptance_of :the_birthstone_of_july, :accept => 'ruby', :message => I18n.t('lt.is_ruby')

end
