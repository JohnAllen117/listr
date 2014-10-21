class Comment < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  validates :user_id, presence: true
  validates :list_id, presence: true
end
