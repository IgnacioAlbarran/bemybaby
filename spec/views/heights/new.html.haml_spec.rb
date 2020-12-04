require 'rails_helper'

RSpec.describe "heights/new", type: :view do
  before(:each) do
    assign(:height, Height.new(
      :height => 1,
      :baby_id => 1
    ))
  end

  it "renders new height form" do
    render

    assert_select "form[action=?][method=?]", heights_path, "post" do

      assert_select "input[name=?]", "height[height]"

      assert_select "input[name=?]", "height[baby_id]"
    end
  end
end
