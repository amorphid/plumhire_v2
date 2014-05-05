class JobsController < ApplicationController
  def edit
    @job = Job.find(params[:id])
  end

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new(id: SecureRandom.uuid)
  end

  def show
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find_or_initialize_by(id: params[:id])

    if @job.update(job_params)
      flash[:success] = "It worked :)"
      redirect_to @job
    else
      render :edit
    end
  end

  private

  def job_params
    params[:job].permit(:body, :title)
  end
end
