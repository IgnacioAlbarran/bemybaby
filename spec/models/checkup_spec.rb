require 'rails_helper'

RSpec.describe Checkup, type: :model do
  it 'knows in which autonomous community the baby lives' do
    user = create(:user)
    baby = create(:baby, territory: Baby::TERRITORIES.first, user_id: user.id)

    expect(baby.territory).to eq('Andalucía')
  end

  # it 'knows the age at which there are vaccines for Comunidad Valenciana' do
  #   expect(Vaccines)
  # end
end
