class AddDeletedAtColumnToBabies < ActiveRecord::Migration[5.2]
  def change
    add_column  :babies, :deleted_at, :datetime, default: nil
  end
end
