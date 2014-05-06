require "spec_helper"

describe ApplicationsController do
  let(:job) { Fabricate(:job) }

  let(:application) do
    Fabricate.build(
      :application,
      id:     SecureRandom.uuid,
      job_id: job.id
    )
  end

  context "PUT /applications/:id" do
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
      application.email = "old@example.com"
      expect { put(
        :update,
        application: application.attributes,
        id:          application.id
      )}.to change{Application.count}.from("old@example.com").to("new@example.com")
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
