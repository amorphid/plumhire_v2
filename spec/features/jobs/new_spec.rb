require "spec_helper"

def test_happy_path
  fill_in(
    "job_title",
    with: Faker::Lorem.sentence
  )
  fill_in(
    "job_body",
    with: Faker::Lorem.paragraph
  )
  click_button("Submit")
  expect(page.body).to have_content("It worked :)")
end

def test_sad_path
  click_button("Submit")
  expect(page.body).to have_content("This value is required.")
end

feature "Creating a new job" do
  before do
    visit jobs_path
    click_link("New job")
  end

  context "on happy path" do
    scenario "displays success message" do
      test_happy_path
    end
  end

  context "using sad path" do
    scenario "displays error message(s)" do
      test_sad_path
    end
  end

  context "using sad path, then happy path" do
    scenario "displays error message(s)" do
      test_sad_path
      test_happy_path
    end
  end
end
