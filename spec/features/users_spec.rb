require 'rails_helper'

describe 'User can log in' do

  scenario 'Valid user can log in' do
    @user = User.create(user_name: "Joe", password: "test")

  visit "/sign-in"

  fill_in 'user_name', :with => "Joe"
  fill_in 'password', :with => "test"

  click_button "Sign In"

  expect(page).to have_content("Sign Out")
  expect(page).to have_content("All Courses")
  end
end
