require "spec_helper"

describe JobsController do
  it "routes to #index" do
    get("/").should route_to("jobs#index")
    get("/jobs").should route_to("jobs#index")
  end
end
