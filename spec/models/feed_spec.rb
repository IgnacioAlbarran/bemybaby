require 'rails_helper'

RSpec.describe Feed, type: :model do
  let!(:father) do
    create(:user, name: 'Pepito', last_name: 'Piscinas', email: 'pepito@piscinas.com')
  end

  let!(:son) do
    create(:baby, user_id: father.id, name: 'Pepito', last_name: 'Piscinas Jr')
  end

  session = {}

  it { should belong_to(:baby) }

  it 'create a feed registry for a baby' do
    create(:feed, baby_id: son.id, date: Date.today, hour: Time.now, mililitres: 50)

    expect(Feed.count).to eq(1)
  end

  it { should validate_presence_of(:date) }

  it { should validate_presence_of(:hour) }

  it { should validate_presence_of(:mililitres) }

  it 'validates that feed is not duplicated (by its time)' do
    create(:feed, baby_id: son.id, date: Date.today, hour: Time.now, mililitres: 50)

    subject.valid? # run validations
    expect(subject.errors[:hour]).to_not include('¡Toma ya registrada!')
  end

  it 'knows the minimum quantity per day from 0 to 6 months old babies' do
    user = create(:user)
    baby_new_born = create(:baby, user_id: user.id, dob: Date.today)
    baby_one_week = create(:baby, user_id: user.id, dob: Date.today - 1.week)
    baby_one_month = create(:baby, user_id: user.id, dob: Date.today - 1.month)
    baby_two_month = create(:baby, user_id: user.id, dob: Date.today - 2.month)
    baby_three_month = create(:baby, user_id: user.id, dob: Date.today - 3.month)
    baby_four_month = create(:baby, user_id: user.id, dob: Date.today - 4.month)
    baby_five_month = create(:baby, user_id: user.id, dob: Date.today - 5.month)
    baby_six_month = create(:baby, user_id: user.id, dob: Date.today - 6.month)

    expect(baby_new_born.min_feed).to eq(20)
    expect(baby_one_week.min_feed).to eq(80)
    expect(baby_one_month.min_feed).to eq(120)
    expect(baby_two_month.min_feed).to eq(150)
    expect(baby_three_month.min_feed).to eq(180)
    expect(baby_four_month.min_feed).to eq(210)
    expect(baby_five_month.min_feed).to eq(240)
    expect(baby_six_month.min_feed).to eq(300)
  end
end
