require "spec_helper"

feature "Visiting a job" do
  given(:job) { Fabricate.build(:job) }

  background do
    job.save
  end

  scenario "displays the job title" do
    visit jobs_path
    click_link("Show")
    expect(page.body).to have_content(job.title)
  end
end
