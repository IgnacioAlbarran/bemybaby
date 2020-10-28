require 'rails_helper'

RSpec.describe "babies/new", type: :view do
  before(:each) do
    @created_user = create(:user)
    session[:user_id] = @created_user.id
    @user = User.find(session[:user_id])
    assign(:baby, Baby.new())
  end

  it "renders new baby form" do
    render

    assert_select "form[action=?][method=?]", user_babies_path(session[:user_id]), "post" do
    end
  end
end
