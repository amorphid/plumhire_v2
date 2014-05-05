require "spec_helper"

describe JobsController do
  it "routes to #new" do
    get("/applications/new").should route_to("applications#new")
  end
end
