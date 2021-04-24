class CreateCheckups < ActiveRecord::Migration[5.2]
  def change
    create_table :checkups do |t|
      t.references :baby, foreign_key: true
      t.date :date
      t.text :notes

      t.timestamps
    end
  end
end
