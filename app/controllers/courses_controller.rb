class CoursesController < ApplicationController
  def index
    @user_course = current_user.user_courses.not_finish.first
    unless @user_course.nil?
      @course = Course.find_by id: @user_course.course_id
      @subjects = @course.subjects unless @course.nil?
    else
      flash[:message] = "You have not joined any course"
      redirect_to sign_out_path
    end
  end
end
