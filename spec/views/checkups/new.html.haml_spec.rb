require 'rails_helper'

RSpec.describe "checkups/new", type: :view do
  before(:each) do
    assign(:checkup, Checkup.new(
      :baby => nil,
      :notes => "MyText"
    ))
  end

  it "renders new checkup form" do
    render

    assert_select "form[action=?][method=?]", checkups_path, "post" do

      assert_select "input[name=?]", "checkup[baby_id]"

      assert_select "textarea[name=?]", "checkup[notes]"
    end
  end
end
