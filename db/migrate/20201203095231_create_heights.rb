class CreateHeights < ActiveRecord::Migration[5.2]
  def change
    create_table :heights do |t|
      t.integer :height
      t.date :date
      t.integer :baby_id

      t.timestamps
    end
  end
end
