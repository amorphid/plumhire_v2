class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new(id: SecureRandom.uuid)
  end

  def update
    @job = Job.find_or_initialize_by(id: params[:id])
    @job.update(job_params)
    render :new
  end

  def job_params
    params[:job].permit(:body, :title)
  end
end
