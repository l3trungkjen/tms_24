class CoursesController < ApplicationController
  before_action :authenticate_user!
  def show
    @user_course = current_user.user_courses.not_finish.first
    unless @user_course.nil?
      if params[:id].blank?
        @course = Course.find @user_course.course_id
      else
        @course = Course.find params[:id]
      end
      unless @course.nil?
        @subjects = @course.subjects
      else
        redirect_to sign_out_path
      end
    else
      flash[:message] = "You have not joined any course"
      redirect_to sign_out_path
    end
  end
end
