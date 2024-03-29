class JobsController < ApplicationController
  before_action :set_job, only: [:edit, :update]

  def edit
  end

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new(id: SecureRandom.uuid)
    render :edit
  end

  def show
    @job = Job.find(params[:id])
  end

  def update
    if @job.update(job_params)
      flash[:success] = "Job has been saved :)"
      redirect_to @job
    else
      render :edit
    end
  end

  private

  def job_params
    params[:job].permit(:body, :title)
  end

  def set_job
    @job = Job.find_or_initialize_by(id: params[:id])
  end
end
