class CreateMeasures < ActiveRecord::Migration[5.2]
  def change
    create_table :measures do |t|

      t.timestamps
    end
  end
end
