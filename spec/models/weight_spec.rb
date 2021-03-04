require 'rails_helper'

RSpec.describe Weight, type: :model do
  let!(:user) { create(:user, name: 'Usuario', last_name: 'Ficticio', email: 'usuarioficticio@gmail.com', level: 1) }
  let!(:baby) { create(:baby, user_id: user.id) }
  let!(:weight) { create(:weight, baby_id: baby.id, weight: 8, date: Date.today) }

  it { should validate_presence_of(:baby_id) }
  it { should validate_presence_of(:weight) }
  it { should validate_presence_of(:date) }

  it 'can create a height measure for a baby' do
    expect(baby.weights.last.weight).not_to eq(3)
    expect(baby.weights.last.weight).to eq(8)
  end
end
