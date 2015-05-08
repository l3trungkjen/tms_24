class User < ActiveRecord::Base
  attr_accessor :remember_token

  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses
  has_many :user_subjects, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :tasks, through: :user_tasks

  validates :name, presence: true, length: {minimum: 3, maximum: 25}

  before_save :set_default

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private
  def set_default
    self.email = email.downcase
  end
end
