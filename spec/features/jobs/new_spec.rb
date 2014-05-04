require "spec_helper"

def test_happy_path
end

def test_sad_path
  visit root_path
  click_link("New job")
  click_button("Submit")
  expect(page.body).to have_content("Title can't be blank")
  expect(page.body).to have_content("Body can't be blank")
end

feature "Creating a new job" do
  context "on happy path" do
    scenario "displays success message" do
      pending
      # test_happy_path
    end
  end

  context "using sad path" do
    scenario "displays error message(s)" do
      test_sad_path
    end
  end

  context "using sad path, then happy path" do
    scenario "displays error message(s)" do
      pending
      # test_sad_path
      # test_happy_path
    end
  end
end
