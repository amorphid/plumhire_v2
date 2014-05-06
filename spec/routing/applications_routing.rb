require "spec_helper"

describe JobsController do
  it "routes to #new" do
    get("/applications/new").should route_to("applications#new")
  end

  it "routes to #update" do
    put("/applications/1").should route_to("applications#update", id: "1")
  end
end
