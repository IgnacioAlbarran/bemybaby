require 'rails_helper'

RSpec.describe "checkups/edit", type: :view do
  before(:each) do
    @checkup = assign(:checkup, Checkup.create!(
      :baby => nil,
      :notes => "MyText"
    ))
  end

  it "renders the edit checkup form" do
    render

    assert_select "form[action=?][method=?]", checkup_path(@checkup), "post" do

      assert_select "input[name=?]", "checkup[baby_id]"

      assert_select "textarea[name=?]", "checkup[notes]"
    end
  end
end
