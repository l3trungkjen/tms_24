class Task < ActiveRecord::Base
  belongs_to :subject
  has_many :user_tasks
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks

  validates :name, presence: true, length: {maximum: 150}
  validates :description, presence: true, length: {maximum: 254}
  validates :content, presence: true

  accepts_nested_attributes_for :user_tasks, allow_destroy: true

  scope :list_task, ->subject{where subject_id: subject.id}
end
