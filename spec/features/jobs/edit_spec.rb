require "spec_helper"

feature "Editting a job" do
  given(:job)       { Fabricate(:job, title: "old title") }
  given(:new_title) { Faker::Lorem.sentence               }

  given(:happy_path) do
    fill_in(
      "job_title",
      with: new_title
    )
    click_button("Submit")
    expect(page.body).to have_content(new_title)
  end

  given(:sad_path) do
    click_button("Submit")
    expect(page.body).not_to have_content(new_title)
  end

  background do
    visit job_path(job)
    click_link("Edit job")
  end

  context "on happy path" do
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
      click_link("Edit job")
      happy_path
    end
  end
end
