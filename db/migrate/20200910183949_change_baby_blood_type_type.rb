class ChangeBabyBloodTypeType < ActiveRecord::Migration[5.2]
  def change
    change_column :babies, :blood_type, :string
  end
end
