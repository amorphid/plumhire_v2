class ApplicationsController < ApplicationController
  def new
    job = Job.find(params[:job_id])
    @application = Application.new(
      id:     SecureRandom.uuid,
      job_id: job.id
    )
    render :edit
  end
end

