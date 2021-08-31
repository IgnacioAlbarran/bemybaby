class Vaccine < ApplicationRecord
  def self.next_vaccines(baby)
    territory = baby.territory
    territory_formatted = territory.downcase.gsub(' ', '_')

    list_of_vaccines = Vaccine.vaccines_"#{territory_formatted}"[baby.age_in_months].to_a
    result = []
    list_of_vaccines.each { |n| result << Vaccine.vaccine_name(n) }
    result
  end

  def self.vaccine_name(num)
    vaccines[num]
  end

  def self.vaccines_for_month(month)
    list_of_vaccines = Vaccine.vaccines_comunidad_valenciana[month].to_a
    result = []
    list_of_vaccines.each { |n| result << Vaccine.vaccine_name(n) }
    result
  end
end