class AddTagIdToWord < ActiveRecord::Migration
  def change
    add_column :words, :tag_id, :integer
    add_column :words, :tag_created_by, :integer
    add_index :words, :tag_id
    add_index :words, :tag_created_by
  end
end
