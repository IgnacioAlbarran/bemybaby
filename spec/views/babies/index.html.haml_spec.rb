require 'rails_helper'

RSpec.describe "babies/index", type: :view do
  before(:each) do
    assign(:babies, [
      Baby.create!(),
      Baby.create!()
    ])
  end

  it "renders a list of babies" do
    render
  end
end
