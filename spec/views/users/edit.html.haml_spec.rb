require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = create(:user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "form input", id: 'Nombre'

      assert_select "form input", id: 'user_last_name'

      assert_select "form input", id: 'user_email'

      assert_select "form input", id: 'user_password'

      assert_select "form input", id: 'user_password_confirmation'
    end
  end
end
