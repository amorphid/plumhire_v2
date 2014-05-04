require "spec_helper"

describe JobsController do
  context "GET /jobs/new" do
    it "sets @job" do
      get(:new)
      expect(assigns[:job]).to be_instance_of(Job)
    end
  end
end
