require "spec_helper"

feature "Visiting the applications page" do
  given(:app1) { Fabricate(:application, title: "job1", job_id: job.id) }
  given(:app2) { Fabricate(:application, title: "job1", job_id: job.id) }
  given(:job) { Fabricate(:job) }

  scenario "lists all the applications for a job" do
    visit job_path(job)
    click_link("2 applications")
    expect(page.body).to have_content(application1.name)
    expect(page.body).to have_content(application2.name)
  end
end
