require "spec_helper"

describe Application do
  context "#email" do
    it { should validate_presence_of(:email)    }
    it { should validate_uniqueness_of(:email)  }
  end

  context "#job" do
    it { should belong_to(:job) }
  end

  context "#name" do
    it { should validate_presence_of(:email) }
  end

  context "#resume_url" do
    it { should validate_presence_of(:resume_url) }
  end
end
