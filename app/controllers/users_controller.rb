class UsersController < ApplicationController
  def show
    if @user_course = current_user.user_courses.not_finish.first
      @course = @user_course.course
      @subjects = @course.subjects unless @course.nil?
    else
      flash[:message] = "You have not joined"
      redirect_to sign_out_path
    end
  end
end
