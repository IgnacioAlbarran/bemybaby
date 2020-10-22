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
end
