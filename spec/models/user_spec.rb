require 'rails_helper'
  RSpec.describe User, type: :model do
    let!(:first_user) { create(:user, name: 'Pepito', email: 'pepito@piscinas.com') }
    let!(:second_user) { create(:user, name: 'Luisito', email: 'luisito@piscinas.com') }

    it 'there is a user called Pepito' do
      expect(first_user.name).to eq('Pepito')
    end

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:last_name) }

    it { should validate_presence_of(:email) }

    it { should validate_presence_of(:password) }

    it { should validate_uniqueness_of(:email) }
  end
