class AddNicovideoLinksToTalks < ActiveRecord::Migration
  def self.up
    add_column :talks, :nicovideo_links, :text
  end

  def self.down
    remove_column :talks, :nicovideo_links
  end
end
