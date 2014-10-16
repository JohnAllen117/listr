class Like < ActiveRecord::Base
  validates :user_id, presence: true, uniqueness: { scope: :list }
  validates :list_id, presence: true

  belongs_to :list
  belongs_to :user
end
