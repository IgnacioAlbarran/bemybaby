class BabyValidator < ActiveModel::Validator
  def validate(record)
    if record.baby_exists?
      record.errors[:base] << "This baby was already registered!!"
    end
  end
end