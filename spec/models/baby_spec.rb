require 'rails_helper'

RSpec.describe Baby, type: :model do
  let!(:father) do
    create(:user, name: 'Pepito', last_name: 'Piscinas',
                  email: 'pepito@piscinas.com')
  end

  let!(:son) do
    create(:baby, user_id: father.id, name: 'Pepito', last_name: 'Piscinas Jr')
  end

  it { should belong_to(:user) }

  it { should have_many(:feeds) }

  it 'there is a baby' do
    expect(Baby.count).to eq(1)
  end

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:last_name) }

  it { should validate_presence_of(:dob) }

  it { should validate_presence_of(:gender) }

  it { should validate_presence_of(:blood_type) }

  it 'a baby with NO same name, last_name, dob and blood_type is valid' do
    new_baby_attributes = {
      name: 'Jaimito', last_name: 'El picaro', dob: '2018-01-01',
      gender: 'niño', blood_type: 'A-', user_id: father.id,
      created_at: Time.now, updated_at: Time.now
    }

    expect(Baby.new(new_baby_attributes)).to be_valid
  end

  it 'a baby with SAME name, last_name, dob and blood_type is invalid' do
    existing_baby_attributes = {
      name: 'Pepito', last_name: 'Piscinas Jr', dob: '2018-01-01',
      gender: 'niño', blood_type: 'A-', user_id: father.id,
      created_at: Time.now, updated_at: Time.now
    }

    expect(Baby.new(existing_baby_attributes)).not_to be_valid
  end

  it 'calculates the total ingested in a day for a baby' do
    session = {}
    session[:baby_id] = son.id

    5.times do
      create(:feed, baby_id: son.id,
                    date: Date.today,
                    hour: Time.now + Feed.count.minutes,
                    mililitres: 50)
    end

    expect(son.total_feeds_in_the_day(Date.today)).to eq(250)
  end

  it 'calculates the list of feeds in a day sorted by hour' do
    5.times do
      create(:feed, baby_id: son.id,
                    date: Date.today,
                    hour: Time.now + Feed.count.minutes,
                    mililitres: 50)
    end

    list = son.feed_list_day(Date.today)

    expect(list.count).to eq(5)
    expect(list.first.hour < list.second.hour).to eq(true)
    expect(list.fourth.hour < list.fifth.hour).to eq(true)
  end

  it 'knows the daily totals of the whole week for the day selected' do
    session = {}
    session[:baby_id] = son.id

    (0..6).each do |num|
      create(:feed, baby_id: son.id,
        date: Date.today.monday + num ,
        hour: Time.now + Feed.count.minutes,
        mililitres: 100 + (num * 100))
    end

    expect(son.feeds_week_by_day(Date.today).keys.count).to eq(7)
    expect(son.feeds_week_by_day(Date.today)['Monday'][:mililitres]).to eq(100)
    expect(son.feeds_week_by_day(Date.today)['Sunday'][:mililitres]).to eq(700)
  end


  it 'knows the age in months for baby' do
    baby = create(:baby, name: "perico", last_name: "palotes", dob: Date.today - 1.year , gender: "niño", blood_type: "A+", user_id: father.id)
    new_born = create(:baby, name: "perico", last_name: "palotes", dob: Date.yesterday, gender: "niño", blood_type: "A+", user_id: father.id)

    expect(baby.name).to eq('perico')
    expect(baby.age_in_months).to eq(12)
    expect(new_born.age_in_months).to eq(0)
  end
end
