class CreateSocialConnects < ActiveRecord::Migration
  def change
    create_table :social_connects do |t|
      t.string :uid
      t.string :provider
      t.integer :user_id

      t.timestamps
    end
  end
  def up
    remove_column :users, :uid
    remove_column :users, :provider
  end

  def down
    add_column :users, :uid, :string
    add_column :users, :provider, :string
  end
end
