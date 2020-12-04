require 'rails_helper'

RSpec.describe "weights/index", type: :view do
  before(:each) do
    assign(:weights, [
      Weight.create!(
        :weight => 2,
        :baby_id => 3
      ),
      Weight.create!(
        :weight => 2,
        :baby_id => 3
      )
    ])
  end

  it "renders a list of weights" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
