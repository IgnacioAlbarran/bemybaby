class VaccinationProgram < ApplicationRecord
  has_many :vaccines
  has_many :territories
end
