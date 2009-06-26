class CreateLightningTalkSelections < ActiveRecord::Migration
  def self.up
    create_table :lightning_talk_selections do |t|
      t.references :lightning_talk_submission
      t.integer :result, :null => false, :default => -1
      t.integer :disp_order, :null => false, :default => 0

      t.timestamps
    end
    LightningTalkSubmission.all.each do |s|
      s.build_lightning_talk_selection(
        :result => LightningTalkSelection::Result.initial)
      s.save
    end
  end

  def self.down
    drop_table :lightning_talk_selections
  end
end
