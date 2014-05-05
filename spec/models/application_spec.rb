require "spec_helper"

describe Application do
  subject do
    Fabricate.build(
      :application,
      email:      "unique@example.com",
      resume_url: "https://unique.example.com"
    )
  end

  before { expect(subject).to be_valid }

  context "#email" do
    it "validates presence" do
      subject.email = ""
      expect(subject).to have(1).errors_on(:email)
    end

    it "validates uniqueness" do
      Fabricate(:application, email: "unique@example.com")
      expect(subject).to have(1).errors_on(:email)
    end
  end

  context "#name" do
    it "validates presence" do
      subject.name = ""
      expect(subject).to have(1).errors_on(:name)
    end
  end

  context "#resume_url" do
    it "validates presence" do
      subject.resume_url = ""
      expect(subject).to have(1).errors_on(:resume_url)
    end

    it "validates uniqueness" do
      Fabricate(:application, resume_url: "https://unique.example.com")
      expect(subject).to have(1).errors_on(:resume_url)
    end
  end
end
