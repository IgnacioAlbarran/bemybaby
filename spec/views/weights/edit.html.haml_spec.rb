require 'rails_helper'

RSpec.describe "weights/edit", type: :view do
  before(:each) do
    @weight = assign(:weight, Weight.create!(
      :weight => 1,
      :baby_id => 1
    ))
  end

  it "renders the edit weight form" do
    render

    assert_select "form[action=?][method=?]", weight_path(@weight), "post" do

      assert_select "input[name=?]", "weight[weight]"

      assert_select "input[name=?]", "weight[baby_id]"
    end
  end
end
