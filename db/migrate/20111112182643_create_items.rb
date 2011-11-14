class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :category_id
      t.boolean :made_to_order
      t.integer :user_id

      t.timestamps
    end
  end
end
