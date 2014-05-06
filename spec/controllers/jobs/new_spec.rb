require "spec_helper"

describe JobsController do
  context "GET /jobs/new" do
    it "redirects" do
      get(:new)
      job = assigns[:job]
      expect(response).to render_template(:edit)
    end
  end
end
