class AddStatusToWordDocument < ActiveRecord::Migration
  def change
    add_column :word_documents, :processed, :boolean, :default => false
    add_index :word_documents, :processed
  end
end
