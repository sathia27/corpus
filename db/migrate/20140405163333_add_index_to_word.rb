class AddIndexToWord < ActiveRecord::Migration
  def change
    add_index :words, :name
  end
end
