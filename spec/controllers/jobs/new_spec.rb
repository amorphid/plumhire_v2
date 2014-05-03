require "spec_helper"

describe JobsController do
  context "GET /jobs" do
    it "sets @jobs" do
      jobs = Fabricate.times(2, :jobs)
      get(:index)
      expect(assigns[:jobs]).to eq(jobs)
    end
  end
end

