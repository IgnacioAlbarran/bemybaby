require 'rails_helper'

RSpec.describe "weights/new", type: :view do
  before(:each) do
    assign(:weight, Weight.new(
      :weight => 1,
      :baby_id => 1
    ))
  end

  it "renders new weight form" do
    render

    assert_select "form[action=?][method=?]", weights_path, "post" do

      assert_select "input[name=?]", "weight[weight]"

      assert_select "input[name=?]", "weight[baby_id]"
    end
  end
end
