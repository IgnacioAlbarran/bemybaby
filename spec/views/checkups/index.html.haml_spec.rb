require 'rails_helper'

RSpec.describe "checkups/index", type: :view do
  before(:each) do
    assign(:checkups, [
      Checkup.create!(
        :baby => nil,
        :notes => "MyText"
      ),
      Checkup.create!(
        :baby => nil,
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of checkups" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
