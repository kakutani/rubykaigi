class CreateTalkDescriptions < ActiveRecord::Migration
  def self.up
    create_table :talk_descriptions do |t|
      t.text :title
      t.text :abstract
      t.text :speaker
      t.text :profile
      t.string :locale, :null => false
      t.references :talk
      t.timestamps
    end
  end

  def self.down
    drop_table :talk_descriptions
  end
end
