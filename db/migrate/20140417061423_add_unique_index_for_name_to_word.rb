class AddUniqueIndexForNameToWord < ActiveRecord::Migration
  def up
    remove_index :words, :name
    add_index :words, :name, :unique => true
  end
  def down
    remove_index :words, :name
    add_index :words, :name
  end
end
