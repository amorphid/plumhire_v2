require "spec_helper"

feature "Creating a new job" do
  given(:happy_path) do
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

  given(:sad_path) do
    click_button("Submit")
    expect(page.body).to have_content("Body can't be blank")
    expect(page.body).to have_content("Title can't be blank")
  end

  before do
    visit jobs_path
    within("#tables") { click_link("New job") }
  end

  context "using happy path" do
    scenario "displays success message" do
      happy_path
    end
  end

  context "using sad path" do
    scenario "displays error message(s)" do
      sad_path
    end
  end

  context "using sad path, then happy path" do
    scenario "displays error message(s)" do
      sad_path
      happy_path
    end
  end
end
