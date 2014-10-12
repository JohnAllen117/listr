class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :list

  validates :list_id, presence: true
  validates :category_id, presence: true
end
