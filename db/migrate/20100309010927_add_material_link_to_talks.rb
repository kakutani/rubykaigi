class AddMaterialLinkToTalks < ActiveRecord::Migration
  def self.up
    add_column :talks, :material_link, :string
  end

  def self.down
    remove_column :talks, :material_link
  end
end
