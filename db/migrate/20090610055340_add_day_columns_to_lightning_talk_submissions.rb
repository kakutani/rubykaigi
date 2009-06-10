class AddDayColumnsToLightningTalkSubmissions < ActiveRecord::Migration
  def self.up
    add_column :lightning_talk_submissions, :day1, :string
    add_column :lightning_talk_submissions, :day2, :string
  end

  def self.down
    remove_column :lightning_talk_submissions, :day2
    remove_column :lightning_talk_submissions, :day1
  end
end
