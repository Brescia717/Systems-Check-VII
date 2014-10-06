require 'rails_helper'

feature "User adds manufacturer to home page" do

  scenario "User successfully adds a manufacturer" do
    manufacturer = FactoryGirl.build(:manufacturer)
    visit root_path

    click_on "Add a Manufacturer"

    fill_in('name', with: manufacturer.name)
    fill_in('country', with: manufacturer.country)

    click_on "Submit Manufacturer"

    expect(page).to have_content(manufacturer.name)
  end
end
