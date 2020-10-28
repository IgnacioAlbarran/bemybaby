require 'rails_helper'

RSpec.describe "babies/index", type: :view do
  before(:each) do
    @user = create(:user, id: 2)
    session[:user_id] = @user.id
    @babies = create_list(:baby, 2, user_id: @user.id)
  end

  it "renders a list of babies" do
    render
  end
end
