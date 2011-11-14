class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :password_digest
      t.integer :state_id
      t.integer :zip
      t.boolean :seller => {:default => false}
      t.boolean :admin => {:default => false}
      t.text :bio

      t.timestamps
    end
  end
end
