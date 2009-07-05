class PrepareTalksRefactoring < ActiveRecord::Migration
  def self.up
    remove_column :talks, :title
    remove_column :talks, :speaker
    remove_column :talks, :language
    remove_column :talks, :summary
    rename_column :talks, :starts_at, :start_at
    rename_column :talks, :ends_at, :end_at

    add_column :talks, :code, :string
    add_column :talks, :email, :string, :null => false
  end

  def self.down
    add_column :talks, :title, :string
    add_column :talks, :speaker, :string
    add_column :talks, :language, :string
    add_column :talks, :summary, :string
    rename_column :talks, :start_at, :starts_at
    rename_column :talks, :end_at, :ends_at

    remove_column :talks, :email
    remove_column :talks, :code
  end
end
