class User < ActiveRecord::Base
  ROLE = %w(0 1)

  attr_accessor :remember_token

  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses

  validates :name, presence: true, length: {minimum: 3, maximum: 25}

  before_save :set_default

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private
  def set_default
    self.email = email.downcase
    self.role = ROLE.first
  end

end
