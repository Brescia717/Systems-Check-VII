require 'rails_helper'

feature "User adds car to manufacturer page" do

  scenario "User successfully adds a car" do
    # manufacturer = FactoryGirl.build(:manufacturer)
    car = FactoryGirl.build(:car)
    visit root_path

    click_on "Adam"
    fill_in('make', with: car.make)
    fill_in('model', with: car.model)
    fill_in('color', with: car.color)
    fill_in('year', with: car.year)
    fill_in('mileage', with: car.mileage)
    fill_in('description', with: car.description)

    click_on "Submit Car"

    expect(page).to have_content("Success")
  end
end
