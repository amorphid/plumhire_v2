require "spec_helper"

describe ApplicationsController do
  context "PUT /applications/:id" do
    let(:job) { Fabricate(:job) }

    let(:application) do
      Fabricate.build(
        :application,
        email:  "old@example.com",
        id:     SecureRandom.uuid,
        job_id: job.id
      )
    end

    it "sets @application" do
      put(
        :update,
        application: application.attributes,
        id:          application.id
      )
      expect(assigns[:application]).to be_instance_of(Application)
    end

    it "creates an application" do
      expect { put(
        :update,
        application: application.attributes,
        id:          application.id
      )}.to change{Application.count}.from(0).to(1)
    end

    it "updates an application" do
      application.save
      put(
        :update,
        application: { email: "new@example.com" },
        id:          application.id
      )
      updated_email = Application.find(application.id).email
      expect(updated_email).to eq("new@example.com")
    end

    it "redirects w/ valid input" do
      put(
        :update,
        application: application.attributes,
        id:          application.id
      )
      expect(response).to redirect_to(application_path(application))
    end

    it "renders template w/ invalid input" do
      put(
        :update,
        application: {},
        id:          application.id
      )
      expect(response).to render_template(:edit)
    end
  end
end
