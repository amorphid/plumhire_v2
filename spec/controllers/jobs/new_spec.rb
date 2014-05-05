require "spec_helper"

describe JobsController do
  context "GET /jobs/new" do
    it "redirects" do
      get(:new)
      job = assigns[:job]
      expect(response).to redirect_to(edit_job_path(job))
    end
  end
end
