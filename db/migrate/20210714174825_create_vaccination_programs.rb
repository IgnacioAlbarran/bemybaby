class CreateVaccinationPrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :vaccination_programs do |t|
      t.references :territory, foreign_key: true
      t.integer :month
      t.references :vaccine, foreign_key: true

      t.timestamps
    end
  end
end
