require 'rails_helper'

feature "User adds car to manufacturer page" do
  before :each do
    @manufacturer = FactoryGirl.create(:manufacturer)
    visit manufacturer_path(@manufacturer)
  end

  context 'user completes all required fields' do
    let(:car) { FactoryGirl.build(:car) }

    before :each do
      fill_in 'Make', with: car.make
      fill_in 'Car model', with: car.car_model
      fill_in 'Color', with: car.color
      fill_in 'Mileage', with: car.mileage
      fill_in 'Description', with: car.description
    end

    scenario 'user completes required fields with valid year' do
      fill_in 'Year', with: car.year
      click_on 'Create Car'

      expect(page).to have_content 'Success'
      expect(page).to have_content car.make
      expect(page).to have_content car.car_model
      expect(page).to have_content car.color
      expect(page).to have_content car.year
      expect(page).to have_content car.mileage
    end

    scenario 'user completes required fields with invalid year' do
      fill_in 'Year', with: 1919
      click_on 'Create Car'

      expect(page).to_not have_content 'Success'
      expect(page).to have_content "Error"
    end
  end

  scenario 'user enters incomplete car info' do
    click_on 'Create Car'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "Error"
  end
  # scenario "User successfully adds a car" do
  #   manufacturer = FactoryGirl.build(:manufacturer)
  #   car = FactoryGirl.build(:car)
  #   visit root_path
  #
  #   click_on "Adam"
  #   fill_in('make', with: car.make)
  #   fill_in('model', with: car.model)
  #   fill_in('color', with: car.color)
  #   fill_in('year', with: car.year)
  #   fill_in('mileage', with: car.mileage)
  #   fill_in('description', with: car.description)
  #
  #   click_on "Submit Car"
  #
  #   expect(page).to have_content("Success")
  # end
end
