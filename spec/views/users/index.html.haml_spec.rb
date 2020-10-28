require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        name: 'Pepito',
        last_name: 'Perez',
        email: "pepito@perez.com",
        password: "Password",
        level: 2
      ),
      User.create!(
        name: 'Neil',
        last_name: 'Diamond',
        email: "neil@diamond.com",
        password: "Password",
        level: 2
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select 'tr>td', text: 'Pepito Perez', count: 1
    assert_select 'tr>td', text: 'Neil Diamond'.to_s, count: 1
    assert_select 'tr>td', text: 'pepito@perez.com', count: 1
    assert_select 'tr>td', text: 'neil@diamond.com', count: 1
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
