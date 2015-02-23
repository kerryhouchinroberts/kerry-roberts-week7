require 'rails_helper'

describe 'User can CRUD courses' do

  scenario 'User can create a course' do

  visit '/'

  click_on "Create a New Course"

  fill_in 'course_title', :with => "Economics"
  choose('course_day_night_true')

  click_on "Create Course"

  expect(page).to have_content("Course was successfully created")
  expect(page).to have_content("All Courses")
  end

  scenario 'User can view a show page for a course' do
  @course = Course.create(title: "Psychology", day_night: false)
  visit "/courses/#{@course.id}"

  expect(page).to have_content @course.title
  end

  scenario 'User can edit a course' do
  @course = Course.create(title: "Psychology", day_night: false)

  visit "/courses/#{@course.id}/edit"

  fill_in 'course_title', :with => "Anthropology"

  click_on "Update Course"

  expect(page).to have_content("Course was successfully updated")
  expect(page).to have_content("Anthropology")
  end

  scenario 'User can delete a course' do
  @course = Course.create(title: "Psychology", day_night: false)

  visit "/courses"

  first(:link, 'Delete Course').click

  expect(page).to have_content("Course was successfully deleted")
  end

end
