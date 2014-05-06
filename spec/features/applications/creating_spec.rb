require "spec_helper"

feature "Creating an application" do
  given(:happy_path) do
    fill_in(
      "application_name",
      with: Faker::Name.name
    )
    fill_in(
      "application_email",
      with: Faker::Internet.email
    )
    fill_in(
      "application_resume_url",
      with: Faker::Internet.email
    )
    click_button("Submit")
    expect(page.body).to have_content("Application has been saved :)")
  end

  given(:sad_path) do
    click_button("Submit")
    expect(page.body).to have_content("Email can't be blank")
    expect(page.body).to have_content("Name can't be blank")
    expect(page.body).to have_content("Resume url can't be blank")
  end

  given(:job) { Fabricate(:job) }

  background do
    visit job_path(job)
    click_link("Apply now")
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
