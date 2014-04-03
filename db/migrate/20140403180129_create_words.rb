class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.integer :user_id
      t.datetime :created_at
      t.datetime :modified_at

      t.timestamps
    end
  end
end
