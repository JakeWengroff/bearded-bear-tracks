class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :url
      t.integer :user_id
      t.integer :topic_id

      t.timestamps null: false
    end
    add_index :bookmarks, :user_id
    add_index :bookmarks, :topic_id
  end
end
