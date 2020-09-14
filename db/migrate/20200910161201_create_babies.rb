class CreateBabies < ActiveRecord::Migration[5.2]
  def change
    create_table :babies do |t|
      t.string :name
      t.string :last_name
      t.date :dob
      t.string :gender
      t.integer :blood_type

      t.timestamps
    end
  end
end
