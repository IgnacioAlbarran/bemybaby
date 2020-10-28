require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                                        name: 'Pepito',
                                        last_name: 'Perez',
                                        email: 'email@email.com',
                                        password: 'password',
                                        level: 1
                                      )
    )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Apellidos/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
  end
end
