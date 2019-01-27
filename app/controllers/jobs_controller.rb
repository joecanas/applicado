class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index]

  def index
    @items_per_page = 5
    @jobs = Job.order_and_paginated(params[:page], @items_per_page)

    render :index 
    # respond_to_html_and_json(@jobs)
  end

  def new
    @job = Job.new
    authorize @job
  end

  def show
    @jobs = Job.all_sort_by_date.page.limit(5)
    render :show
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    authorize @job

    if @job.save
      redirect_to @job, alert: "Job opening created"
    else
      # Preserve validation error message array before render
      flash[:message] = @job.errors.full_messages
      render new_job_path, alert: "Error: Your job opening could not be created"
    end
  end

  def edit
    authorize @job
  end

  def update
    authorize @job
    @job.update(job_params)
    redirect_to @job, alert: "Job opening updated"
  end

  def dashboard
    if current_user.employer?
      @jobs = current_user.jobs.order_and_paginated(params[:page], 5)
    else
      redirect_to root_path, alert: "Unauthorized access"
    end
  end

  def destroy
    authorize @job
    @job.destroy
    redirect_to root_path, alert: "Job opening deleted"
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :company, :location, :company_id)
  end
end