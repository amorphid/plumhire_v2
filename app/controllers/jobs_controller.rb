class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new(id: SecureRandom.uuid)
  end
end
