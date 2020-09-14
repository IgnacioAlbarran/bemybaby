class ChangeBabyBloodTypeColumnType < ActiveRecord::Migration[5.2]
  def change
    def up
      execute <<-SQL
        CREATE TYPE blood_type AS ENUM ("A+", "A-", "B+", "B-", "AB+", "AB-", "0+", "0-");
        ALTER TABLE babies MODIFY blood_type blood_type;
      SQL
    end

    def down
      execute <<-SQL
        DROP TYPE blood_type;
      SQL
      change_column :babies, :blood_type, :integer # Previous type
    end
  end
end
