require 'rails_helper'

RSpec.describe "checkups/show", type: :view do
  before(:each) do
    @checkup = assign(:checkup, Checkup.create!(
      :baby => nil,
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
