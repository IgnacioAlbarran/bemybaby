class CreateHeights < ActiveRecord::Migration[5.2]
  def change
    create_table :heights do |t|
      t.references :baby, index: true
      t.integer :height
      t.timestamp :date

      t.timestamps
    end
  end
end
