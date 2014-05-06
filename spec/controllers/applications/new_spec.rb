require "spec_helper"

describe ApplicationsController do
  context "GET /applications/new" do
    let(:job) { Fabricate(:job) }

    it "sets @application" do
      get(
        :new,
        job_id: job.id
      )
      expect(assigns[:application]).to be_instance_of(Application)
    end

    it "renders edit template" do
      get(
        :new,
        job_id: job.id
      )
      expect(response).to render_template(:edit)
    end
  end
end
