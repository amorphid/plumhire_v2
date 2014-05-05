require "spec_helper"

feature "Visiting a job" do
  given(:job) { Fabricate(:job) }

  background do
    job
  end

  scenario "displays the job title" do
    visit jobs_path
    click_link("Show")
    expect(page.body).to have_content(job.title)
  end
end
