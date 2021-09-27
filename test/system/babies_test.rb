require "application_system_test_case"

class BabiesTest < ApplicationSystemTestCase
  setup do
    @baby = babies(:one)
  end

  test "visiting the index" do
    visit babies_url
    assert_selector "h1", text: "Babies"
  end

  test "creating a Baby" do
    visit babies_url
    click_on "New Baby"

    fill_in "Blood type", with: @baby.blood_type
    fill_in "Dob", with: @baby.dob
    fill_in "Gender", with: @baby.gender
    fill_in "Last name", with: @baby.last_name
    fill_in "Name", with: @baby.name
    click_on "Create Baby"

    assert_text "Bebé registrado correctamente"
    click_on "Back"
  end

  test "updating a Baby" do
    visit babies_url
    click_on "Edit", match: :first

    fill_in "Blood type", with: @baby.blood_type
    fill_in "Dob", with: @baby.dob
    fill_in "Gender", with: @baby.gender
    fill_in "Last name", with: @baby.last_name
    fill_in "Name", with: @baby.name
    click_on "Update Baby"

    assert_text "Datos del bebé actualizados"
    click_on "Back"
  end

  test "destroying a Baby" do
    visit babies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Datos del bebé borrados"
  end
end
