require "spec_helper"

describe Application do
  subject do
    Fabricate.build(
      :application,
      email: "unique@example.com",
      resume_url:   "https://unique.example.com"
    )
  end

  context "#email" do
    before { expect(subject).to have(0).errors_on(:email) }

    it "validates presence" do
      expect(subject).to have(0).errors_on(:email)
      subject.email = ""
      expect(subject).to have(1).errors_on(:email)
    end

    it "validates uniqueness" do
      subject.save
      subject.email = "not_unique@example.com"
      expect(subject).to have(1).errors_on(:email)
    end
  end

  context "#name" do
    it "validates presence" do
      expect(subject).to have(0).errors_on(:name)
      subject.name = ""
      expect(subject).to have(1).errors_on(:name)
    end
  end

  context "#url" do
    before { expect(subject).to have(0).errors_on(:resume_url) }

    it "validates presence" do
      subject.resume_url = ""
      expect(subject).to have(1).errors_on(:resume_url)
    end

    it "validates uniqueness" do
      subject.save
      subject.resume_url = "not_unique.example.com"
      expect(subject).to have(1).errors_on(:resume_url)
    end
  end
end
