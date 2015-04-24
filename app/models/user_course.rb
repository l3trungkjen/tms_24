class UserCourse < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  validates :user_id, presence: true
  validates :course_id, presence: true
  validates :user_id, uniqueness: {scope: :course_id}

  scope :not_finish, ->{where status: false}
end
