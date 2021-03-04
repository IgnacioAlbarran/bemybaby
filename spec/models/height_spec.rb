require 'rails_helper'

RSpec.describe Height, type: :model do
  let!(:user) { create(:user, name: 'Usuario', last_name: 'Ficticio', email: 'usuarioficticio@gmail.com', level: 1) }
  let!(:baby) { create(:baby, user_id: user.id) }
  let!(:height) { create(:height, baby_id: baby.id, height: 70, date: Date.today) }

  it { should validate_presence_of(:baby_id) }
  it { should validate_presence_of(:height) }
  it { should validate_presence_of(:date) }

  it 'can create a height measure for a baby' do
    expect(baby.heights.last.height).not_to eq(80)
    expect(baby.heights.last.height).to eq(70)
  end
end
