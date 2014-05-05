require "spec_helper"

describe JobsController do
  context "GET /applications/new" do
    let(:job_id) { Fabricate(:job).id }

    it "sets @application" do
      get(
        :new,
        job_id: job_id
      )
      expect(assigns[:application]).to be_instance_of(Application)
    end

    it "renders edit template" do
      get(
        :new,
        job_id: job_id
      )
      expect(response).to render_template(:edit)
    end
  end
end
