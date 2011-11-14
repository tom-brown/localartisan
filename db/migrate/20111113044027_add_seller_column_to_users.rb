class AddSellerColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :seller, :boolean, :default => false
    add_column :users, :admin, :boolean, :default => false
  end
end
