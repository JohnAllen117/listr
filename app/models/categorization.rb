class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :list

  validates :list, presence: true
  validates :category, presence: true
end
