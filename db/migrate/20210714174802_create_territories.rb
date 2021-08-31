class CreateTerritories < ActiveRecord::Migration[5.2]
  def change
    create_table :territories do |t|
      t.string :territory_code
      t.string :territory_name

      t.timestamps
    end
  end
end
