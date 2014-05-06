class ApplicationsController < ApplicationController
  def new
    job = Job.find(params[:job_id])
    @application = Application.new(
      id:     SecureRandom.uuid,
      job_id: job.id
    )
    render :edit
  end

  def update
    @application = Application.find_or_initialize_by(id: params[:id])

    if @application.update(application_params)
      redirect_to application_path(@application)
    else
      render :edit
    end
  end

  private

  def application_params
    params[:application].permit(:email, :job_id, :name, :resume_url)
  end
end

