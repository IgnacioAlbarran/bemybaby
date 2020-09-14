require 'rails_helper'

RSpec.describe "babies/new", type: :view do
  before(:each) do
    assign(:baby, Baby.new())
  end

  it "renders new baby form" do
    render

    assert_select "form[action=?][method=?]", babies_path, "post" do
    end
  end
end
