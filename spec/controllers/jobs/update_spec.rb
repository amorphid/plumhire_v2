require "spec_helper"

describe JobsController do
  context "PUT /jobs/:id" do
    it "sets @job" do
      job = Fabricate.build(:job, id: SecureRandom.uuid)
      put(
        :update,
        job: job.attributes,
        id:  job.id
      )
      expect(assigns[:job]).to be_instance_of(Job)
    end

    it "creates a job" do
      job = Fabricate.build(:job, id: SecureRandom.uuid)
      expect { put(
        :update,
        job: job.attributes,
        id:  job.id
      )}.to change{Job.count}.from(0).to(1)
    end

    it "updates a job" do
      title1 = "before"
      title2 = "after"
      job = Fabricate(:job, title: title1)
      job.title = title2
      put(
        :update,
        job: job.attributes,
        id:  job.id
      )
      expect(Job.find(job).title).to eq(title2)
    end

    it "redirects w/ valid input" do
      job = Fabricate.build(:job, id: SecureRandom.uuid)
      put(
        :update,
        job: job.attributes,
        id:  job.id
      )
      expect(response).to redirect_to(job_path(job))
    end

    it "renders template w/ invalid input" do
      put(
        :update,
        job: {},
        id:  SecureRandom.uuid
      )
      expect(response).to render_template(:edit)
    end
  end
end
