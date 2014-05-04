class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new(id: SecureRandom.uuid)
  end

  def show
  end

  def update
    @job = Job.find_or_initialize_by(id: params[:id])

    if @job.update(job_params)
      flash[:success] = "It worked :)"
      redirect_to @job
    else
      render :new
    end
  end

  def job_params
    params[:job].permit(:body, :title)
  end
end
