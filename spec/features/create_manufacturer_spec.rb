require 'rails_helper'

feature "User adds manufacturer to home page" do

  scenario "User successfully adds a manufacturer" do
    visit root_path

    click_on "Add a Manufacturer"
    #
    fill_in('Name', with: 'butts')
    fill_in('Country', with: 'buttsville')
    #
    click_on "Submit Manufacturer"
    #
    expect(page).to have_content('butts')
  end
end
