class ChangeRoomTypeOnTalks < ActiveRecord::Migration
  def self.up
    change_column :talks, :room, :string
  end

  def self.down
    change_column :talks, :room, :integer
  end
end
