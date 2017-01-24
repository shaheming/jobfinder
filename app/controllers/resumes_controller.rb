
class ResumesController < ApplicationController
  before_action :authenticate_user!

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.job = @job
    @resume.user = current_user
    if current_user.has_applied?(@job)
      flash[:warning] = "You have applied this position!"
      redirect_to job_path(@job)
    else
      if @resume.save
        current_user.join!(@job)
        redirect_to job_path(@job),notice: "upload successfully!"
      else
        render :new
      end

    end
  end

  private

  def resume_params
    params.require(:resume).permit(:content,:attachment)
  end
end