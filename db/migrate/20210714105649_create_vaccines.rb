class CreateVaccines < ActiveRecord::Migration[5.2]
  def change
    create_table :vaccines do |t|
      t.string :short_name
      t.string :name

      t.timestamps
    end
  end
end
