class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.date :date
      t.time :hour
      t.integer :mililitres
      t.references :baby, index: true

      t.timestamps
    end
  end
end
