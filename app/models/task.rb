class Task < ActiveRecord::Base
  belongs_to :subject
  has_many :user_tasks

  scope :list_task, ->subject{where subject_id: subject.id}
end
