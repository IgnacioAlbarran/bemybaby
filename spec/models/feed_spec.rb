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

  it 'calculates the total quantity of feeds in a day for a baby' do
    session[:baby_id] = son.id

    5.times do
      create(:feed, baby_id: son.id,
                    date: Date.today,
                    hour: Time.now + Feed.count.minutes,
                    mililitres: 50)
    end

    expect(son.feeds_in_the_day).to eq(250)
  end
end
