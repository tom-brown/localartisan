class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :item_id
      t.string :note

      t.timestamps
    end
  end
end
