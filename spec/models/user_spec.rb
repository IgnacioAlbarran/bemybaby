require 'rails_helper'
  RSpec.describe User, type: :model do
    let!(:first_user) { create(:user, name: 'Pepito', last_name: 'Piscinas', email: 'pepito@piscinas.com') }

    it 'there is a user called Pepito' do
      expect(first_user.name).to eq('Pepito')
    end

    it { should have_many(:babies) }

    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2)}

    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name).is_at_least(2)}

    it { should validate_presence_of(:email) }

    it { should validate_presence_of(:password) }

    it { should validate_uniqueness_of(:email) }

    it { should validate_confirmation_of(:password) }

    it 'full_name gives name+last_name string' do
      user = first_user
      result = first_user.full_name
      expect(result).to eq('Pepito Piscinas')
    end

    it { should_not allow_value("blah").for(:email) }

    it { should allow_value("a@b.com").for(:email) }
  end
