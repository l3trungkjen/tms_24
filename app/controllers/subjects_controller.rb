class SubjectsController < ApplicationController
  def show
    @course = Course.find params[:course_id]
    @subject = Subject.find params[:id]
  end

  def update
    @course = Course.find params[:course_id]
    @subject = Subject.find params[:id]
    if @subject.update_attributes subject_params
      flash[:message] = "Task was updated successfully..."
    else
      flash[:message] = "Task was updated failure..."
    end
    redirect_to [@course, @subject]
  end

  private
  def subject_params
    params.require(:subject).permit tasks_attributes: [:id,
      [user_tasks_attributes: [:id, :user_id, :status]]]
  end
end
