require "spec_helper"

describe ApplicationsController do
  context "GET /applications/:id" do
    let(:application) { Fabricate(:application) }

    it "sets @application" do
      get(
        :show,
        application: application.attributes,
        id:          application.id
      )
      expect(assigns[:application]).to be_instance_of(Application)
    end
  end
end
