class CreateTalks < ActiveRecord::Migration
  def self.up
    create_table :talks do |t|
      t.string :title
      t.string :speaker
      t.string :language
      t.text :summary
      t.integer :year
      t.integer :room
      t.datetime :starts_at
      t.datetime :ends_at
      t.timestamps
    end
  end

  def self.down
    drop_table :talks
  end
end
