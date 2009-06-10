class CreateLightningTalkSubmissions < ActiveRecord::Migration
  def self.up
    create_table :lightning_talk_submissions do |t|
      t.text :name
      t.text :organization
      t.text :email
      t.text :title
      t.text :abstract
      t.boolean :has_ticket
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :lightning_talk_submissions
  end
end
