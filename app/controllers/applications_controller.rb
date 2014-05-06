class ApplicationsController < ApplicationController
  def new
    job = Job.find(params[:job_id])
    @application = Application.new(job_id: job.id)
    render :edit
  end
end

