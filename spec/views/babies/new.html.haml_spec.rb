require 'rails_helper'

RSpec.describe "babies/new", type: :view do
  before(:each) do
    assign(:baby, Baby.new())
  end

  it "renders new baby form" do
    render

    assert_select "form[action=?][method=?]", user_babies_path(current_user), "post" do
    end
  end
end
