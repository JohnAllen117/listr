class Like < ActiveRecord::Base
  validates :user_id, presence: true
  validates :list_id, presence: true

  belongs_to :list
  belongs_to :user
end
