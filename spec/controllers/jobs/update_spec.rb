require "spec_helper"

describe JobsController do
  context "PUT /jobs/:id" do
    let(:job) do
      Fabricate.build(
        :job,
        id:    SecureRandom.uuid,
        title: "old title"
      )
    end

    it "sets @job" do
      put(
        :update,
        job: job.attributes,
        id:  job.id
      )
      expect(assigns[:job]).to be_instance_of(Job)
    end

    it "creates a job" do
      expect { put(
        :update,
        job: job.attributes,
        id:  job.id
      )}.to change{Job.count}.from(0).to(1)
    end

    it "updates a job" do
      job.save
      put(
        :update,
        job: { title: "new title" },
        id:  job.id
      )
      updated_title = Job.find(job).title
      expect(updated_title).to eq("new title")
    end

    it "redirects w/ valid input" do
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
        id:  job.id
      )
      expect(response).to render_template(:edit)
    end
  end
end
