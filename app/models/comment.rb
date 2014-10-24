class Comment < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  validates :user_id, presence: true
  validates :list_id, presence: true
  validates_length_of :content, in: 1..10000
end
