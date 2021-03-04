class CreateWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :weights do |t|
      t.references :baby, index: true
      t.integer :weight
      t.timestamp :date

      t.timestamps
    end
  end
end
