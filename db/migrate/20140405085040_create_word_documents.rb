class CreateWordDocuments < ActiveRecord::Migration
  def change
    create_table :word_documents do |t|
      t.string :word_list_file
      t.integer :user_id

      t.timestamps
    end
  end
end
