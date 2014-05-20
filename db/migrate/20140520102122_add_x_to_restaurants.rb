class AddXToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :cuisine, :string
  end
end
