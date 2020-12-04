require 'rails_helper'

RSpec.describe "heights/index", type: :view do
  before(:each) do
    assign(:heights, [
      Height.create!(
        :height => 2,
        :baby_id => 3
      ),
      Height.create!(
        :height => 2,
        :baby_id => 3
      )
    ])
  end

  it "renders a list of heights" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
