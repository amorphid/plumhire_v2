require "spec_helper"

describe Job do
  subject { Fabricate.build(:job) }

  context "#body" do
    it "validates presence" do
      expect(subject).to have(0).errors_on(:body)
      subject.body = ""
      expect(subject).to have(1).errors_on(:body)
    end
  end

  context "#title" do
    it "validates presence" do
      expect(subject).to have(0).errors_on(:title)
      subject.title = ""
      expect(subject).to have(1).errors_on(:title)
    end

    it "validates length" do
      expect(subject).to have(0).errors_on(:title)
      subject.title = Faker::Lorem.characters(256)
      expect(subject).to have(1).errors_on(:title)
    end
  end
end
