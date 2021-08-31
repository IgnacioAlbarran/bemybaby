class AddTerritoryToBaby < ActiveRecord::Migration[5.2]
  def change
    add_column :babies, :territory, :string
  end
end
