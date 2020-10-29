require 'rails_helper'

RSpec.describe "babies/edit", type: :view do
  before(:each) do
    @user = create(:user)
    session[:user_id] = @user.id
    @baby = create(:baby, user_id: @user.id)
  end

  it "renders the edit baby form" do
    render

    assert_select "form[action=?][method=?]", baby_path(@baby), "post" do
    end
  end
end
