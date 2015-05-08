class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  validates :user_id, presence: true
  validates :subject_id, presence: true
  validates :user_id, uniqueness: {scope: :subject_id}
end
