class CreateHeadlineEntries < ActiveRecord::Migration
  def self.up
    create_table :headline_entries do |t|
      t.text :title
      t.datetime :time
      t.text :link
      t.text :content

      t.timestamps
    end
    add_index :headline_entries, :time
  end

  def self.down
    drop_table :headline_entries
  end
end
