require "rails_helper"

feature "User adds car to manufacturer page" do

  scenario "User successfully adds a car" do

    visit root_path

    click_on "Add a Manufacturer"
    #
    fill_in("Name", with: "butts")
    fill_in("Country", with: "buttsville")
    #
    click_on "Submit Manufacturer"
    #
    expect(page).to have_content("butts")

    fill_in("Make", with: "Adam")
    fill_in("Model", with: "Foo")
    fill_in("Color", with: "Bar")
    fill_in("Year", with: 2014)
    fill_in("Mileage", with: 9001)
    fill_in("Description", with: "It's over 9000!")

    click_on "Submit Car"

    expect(page).to have_content("Foo")
  end
end
