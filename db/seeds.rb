# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require 'factory_bot_rails'

if User.count.zero?
  10.times do
    FactoryBot.create(:user)
  end

  User.all.each do |user|
    FactoryBot.create(:baby, user_id: user.id)
  end
end

if Vaccine.count.zero?
  Vaccine.create(name: 'Hepatitis B', short_name: 'hepb')
  Vaccine.create(name: 'Difteria', short_name: 'dift')
  Vaccine.create(name: 'Tétanos', short_name: 'tets')
  Vaccine.create(name: 'Tos Ferina', short_name: 'tosf')
  Vaccine.create(name: 'Poliomelitis', short_name: 'poli')
  Vaccine.create(name: 'Haemophilus Influenzae tipo B', short_name: 'flub')
  Vaccine.create(name: 'Neumococo', short_name: 'neum')
  Vaccine.create(name: 'Meningococo C', short_name: 'menc')
  Vaccine.create(name: 'Sarampión', short_name: 'sara')
  Vaccine.create(name: 'Rubeola', short_name: 'rube')
  Vaccine.create(name: 'Parotiditis', short_name: 'paro')
  Vaccine.create(name: 'Varicela', short_name: 'vari')
  Vaccine.create(name: 'Virus del Papiloma Humano', short_name: 'VPH')
end

if Territory.count.zero?
  Territory.create(territory_code: 'anda', territory_name: 'Andalucía')
  Territory.create(territory_code: 'arag', territory_name: 'Aragón')
  Territory.create(territory_code: 'astu', territory_name: 'Asturias')
  Territory.create(territory_code: 'bale', territory_name: 'Baleares')
  Territory.create(territory_code: 'cana', territory_name: 'Canarias')
  Territory.create(territory_code: 'cant', territory_name: 'Cantabria')
  Territory.create(territory_code: 'cman', territory_name: 'Castilla la Mancha')
  Territory.create(territory_code: 'cleo', territory_name: 'Castilla y León')
  Territory.create(territory_code: 'cata', territory_name: 'Cataluña')
  Territory.create(territory_code: 'ceut', territory_name: 'Ceuta')
  Territory.create(territory_code: 'cval', territory_name: 'Comunidad Valenciana')
  Territory.create(territory_code: 'extr', territory_name: 'Extremadura')
  Territory.create(territory_code: 'gali', territory_name: 'Galicia')
  Territory.create(territory_code: 'lrio', territory_name: 'La Rioja')
  Territory.create(territory_code: 'madr', territory_name: 'Madrid')
  Territory.create(territory_code: 'meli', territory_name: 'Melilla')
  Territory.create(territory_code: 'murc', territory_name: 'Murcia')
  Territory.create(territory_code: 'nava', territory_name: 'Navarra')
  Territory.create(territory_code: 'pvas', territory_name: 'País Vasco')
end

if VaccinationProgram.where(territory_id: 11).count.zero?
  VaccinationProgram.create(territory_id: 11, month: 2, vaccine_id: 1)
  VaccinationProgram.create(territory_id: 11, month: 2, vaccine_id: 2)
  VaccinationProgram.create(territory_id: 11, month: 2, vaccine_id: 3)
  VaccinationProgram.create(territory_id: 11, month: 2, vaccine_id: 4)
  VaccinationProgram.create(territory_id: 11, month: 2, vaccine_id: 5)
  VaccinationProgram.create(territory_id: 11, month: 2, vaccine_id: 6)
  VaccinationProgram.create(territory_id: 11, month: 2, vaccine_id: 7)

  VaccinationProgram.create(territory_id: 11, month: 4, vaccine_id: 1)
  VaccinationProgram.create(territory_id: 11, month: 4, vaccine_id: 4)
  VaccinationProgram.create(territory_id: 11, month: 4, vaccine_id: 3)
  VaccinationProgram.create(territory_id: 11, month: 4, vaccine_id: 4)
  VaccinationProgram.create(territory_id: 11, month: 4, vaccine_id: 5)
  VaccinationProgram.create(territory_id: 11, month: 4, vaccine_id: 6)
  VaccinationProgram.create(territory_id: 11, month: 4, vaccine_id: 7)
  VaccinationProgram.create(territory_id: 11, month: 4, vaccine_id: 8)

  VaccinationProgram.create(territory_id: 11, month: 11, vaccine_id: 1)
  VaccinationProgram.create(territory_id: 11, month: 11, vaccine_id: 2)
  VaccinationProgram.create(territory_id: 11, month: 11, vaccine_id: 3)
  VaccinationProgram.create(territory_id: 11, month: 11, vaccine_id: 4)
  VaccinationProgram.create(territory_id: 11, month: 11, vaccine_id: 5)
  VaccinationProgram.create(territory_id: 11, month: 11, vaccine_id: 6)
  VaccinationProgram.create(territory_id: 11, month: 11, vaccine_id: 7)

  VaccinationProgram.create(territory_id: 11, month: 12, vaccine_id: 8)
  VaccinationProgram.create(territory_id: 11, month: 12, vaccine_id: 11)

  VaccinationProgram.create(territory_id: 11, month: 15, vaccine_id: 12)

  VaccinationProgram.create(territory_id: 11, month: 36, vaccine_id: 9)
  VaccinationProgram.create(territory_id: 11, month: 36, vaccine_id: 10)
  VaccinationProgram.create(territory_id: 11, month: 36, vaccine_id: 11)
  VaccinationProgram.create(territory_id: 11, month: 36, vaccine_id: 12)

  VaccinationProgram.create(territory_id: 11, month: 72, vaccine_id: 2)
  VaccinationProgram.create(territory_id: 11, month: 72, vaccine_id: 3)
  VaccinationProgram.create(territory_id: 11, month: 72, vaccine_id: 4)
  VaccinationProgram.create(territory_id: 11, month: 72, vaccine_id: 5)

  VaccinationProgram.create(territory_id: 11, month: 144, vaccine_id: 8)
  VaccinationProgram.create(territory_id: 11, month: 144, vaccine_id: 12)
  VaccinationProgram.create(territory_id: 11, month: 144, vaccine_id: 13)

  VaccinationProgram.create(territory_id: 11, month: 168, vaccine_id: 2)
  VaccinationProgram.create(territory_id: 11, month: 168, vaccine_id: 3)
end

if VaccinationProgram.where(territory_id: 12).count.zero?
  VaccinationProgram.create(territory_id: 12, month: 2, vaccine_id: 1)
  VaccinationProgram.create(territory_id: 12, month: 2, vaccine_id: 2)
  VaccinationProgram.create(territory_id: 12, month: 2, vaccine_id: 3)
  VaccinationProgram.create(territory_id: 12, month: 2, vaccine_id: 4)
  VaccinationProgram.create(territory_id: 12, month: 2, vaccine_id: 5)
  VaccinationProgram.create(territory_id: 12, month: 2, vaccine_id: 6)
  VaccinationProgram.create(territory_id: 12, month: 2, vaccine_id: 7)

  VaccinationProgram.create(territory_id: 12, month: 4, vaccine_id: 1)
  VaccinationProgram.create(territory_id: 12, month: 4, vaccine_id: 2)
  VaccinationProgram.create(territory_id: 12, month: 4, vaccine_id: 3)
  VaccinationProgram.create(territory_id: 12, month: 4, vaccine_id: 4)
  VaccinationProgram.create(territory_id: 12, month: 4, vaccine_id: 5)
  VaccinationProgram.create(territory_id: 12, month: 4, vaccine_id: 6)
  VaccinationProgram.create(territory_id: 12, month: 4, vaccine_id: 7)
  VaccinationProgram.create(territory_id: 12, month: 4, vaccine_id: 8)

  VaccinationProgram.create(territory_id: 12, month: 11, vaccine_id: 1)
  VaccinationProgram.create(territory_id: 12, month: 11, vaccine_id: 2)
  VaccinationProgram.create(territory_id: 12, month: 11, vaccine_id: 3)
  VaccinationProgram.create(territory_id: 12, month: 11, vaccine_id: 4)
  VaccinationProgram.create(territory_id: 12, month: 11, vaccine_id: 5)
  VaccinationProgram.create(territory_id: 12, month: 11, vaccine_id: 6)
  VaccinationProgram.create(territory_id: 12, month: 11, vaccine_id: 7)

  VaccinationProgram.create(territory_id: 12, month: 12, vaccine_id: 8)
  VaccinationProgram.create(territory_id: 12, month: 12, vaccine_id: 9)
  VaccinationProgram.create(territory_id: 12, month: 12, vaccine_id: 10)
  VaccinationProgram.create(territory_id: 12, month: 12, vaccine_id: 11)

  VaccinationProgram.create(territory_id: 12, month: 15, vaccine_id: 12)

  VaccinationProgram.create(territory_id: 12, month: 48, vaccine_id: 9)
  VaccinationProgram.create(territory_id: 12, month: 48, vaccine_id: 10)
  VaccinationProgram.create(territory_id: 12, month: 48, vaccine_id: 11)
  VaccinationProgram.create(territory_id: 12, month: 48, vaccine_id: 12)

  VaccinationProgram.create(territory_id: 12, month: 72, vaccine_id: 2)
  VaccinationProgram.create(territory_id: 12, month: 72, vaccine_id: 3)
  VaccinationProgram.create(territory_id: 12, month: 72, vaccine_id: 4)
  VaccinationProgram.create(territory_id: 12, month: 72, vaccine_id: 5)

  VaccinationProgram.create(territory_id: 12, month: 144, vaccine_id: 8)
  VaccinationProgram.create(territory_id: 12, month: 144, vaccine_id: 13)

  VaccinationProgram.create(territory_id: 12, month: 144, vaccine_id: 2)
  VaccinationProgram.create(territory_id: 12, month: 144, vaccine_id: 3)
end