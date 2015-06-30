class CreateLikes < ActiveRecord::Migration
  def change
<<<<<<< HEAD
    create_table :likes do |t|   
=======
    create_table :likes do |t|
>>>>>>> 92a72f27f048ff23fd4c2b995da069e63d3033f7
      t.references :bookmark, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
