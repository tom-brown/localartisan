class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :state_abbreviation

      t.timestamps
    end
  end
end
