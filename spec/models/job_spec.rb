require "spec_helper"

describe Job do
  subject { Job.new }

  context "#body" do
    it "validates presence" do
      expect(subject).to have(1).errors_on(:body)
      subject.body = Faker::Lorem.sentence
      expect(subject).to have(0).errors_on(:body)
    end
  end

  context "#title" do
    it "validates presence" do
      expect(subject).to have(1).errors_on(:title)
      subject.title = Faker::Lorem.paragraph
      expect(subject).to have(0).errors_on(:title)
    end
  end
end
