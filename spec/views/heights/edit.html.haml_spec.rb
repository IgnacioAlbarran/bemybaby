require 'rails_helper'

RSpec.describe "heights/edit", type: :view do
  before(:each) do
    @height = assign(:height, Height.create!(
      :height => 1,
      :baby_id => 1
    ))
  end

  it "renders the edit height form" do
    render

    assert_select "form[action=?][method=?]", height_path(@height), "post" do

      assert_select "input[name=?]", "height[height]"

      assert_select "input[name=?]", "height[baby_id]"
    end
  end
end
