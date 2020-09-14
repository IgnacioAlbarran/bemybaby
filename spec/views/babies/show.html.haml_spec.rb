require 'rails_helper'

RSpec.describe "babies/show", type: :view do
  before(:each) do
    @baby = assign(:baby, Baby.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
