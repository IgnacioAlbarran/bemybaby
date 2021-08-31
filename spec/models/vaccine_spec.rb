require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:first_user) do
    create(:user, name: 'Pepito', last_name: 'Piscinas', email: 'pepito@piscinas.com')
  end

  it 'knows the ages when a child is vaccinated in Comunidad Valenciana' do
    expect(Vaccine.vaccines_comunidad_valenciana.keys).to eq([2, 4, 11, 12, 15, 36, 72, 144, 168])
  end

  it 'knows the vaccines for the first vaccination of a baby in Comunidad Valenciana' do
    month = 2

    expect(Vaccine.vaccines_for_month(month)).to eq(["Hepatitis B", "Difteria", "Tétanos", "Tos Ferina",
                          "Poliomelitis", "Haemophilus Influenzae tipo B", "Neumococo"])
  end

  it 'knows the vaccines in the next vaccination for a baby' do
    user = create(:user)
    baby = create(:baby, user_id: user.id, dob: Date.today - 15.month, territory: 'Comunidad Valenciana')

    result = baby.next_vaccines

    expect(result).to eq('Varicela')
  end
end
