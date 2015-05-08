class Subject < ActiveRecord::Base
  has_many :course_subjects, dependent: :destroy
  has_many :courses, through: :course_subjects
  has_many :user_subjects
  has_many :tasks, dependent: :destroy

  validates :name, presence: true, length: {maximum: 254}
  validates :length, inclusion: {in: 1..9}
  validates :description, length: {maximum: 254}

  accepts_nested_attributes_for :tasks, allow_destroy: true
end
