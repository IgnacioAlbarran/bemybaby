require 'rails_helper'

RSpec.describe "babies/show", type: :view do
  before(:each) do
    @user = create(:user)
    session[:user_id] = @user.id
    @baby = create(:baby, user_id: @user.id)
  end

  it "renders attributes in <p>" do
    render
  end
end
