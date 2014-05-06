require "spec_helper"

describe Job do
  context "#applications" do
    it { should have_many(:applications) }
  end

  context "#body" do
    it { should validate_presence_of(:body)  }
  end

  context "#title" do
    it { should ensure_length_of(:title).is_at_most(255) }
    it { should validate_presence_of(:title)             }
  end
end
