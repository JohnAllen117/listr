class Category < ActiveRecord::Base
  has_many :lists, through: :categorizations

  validates :name, presence: true
  validates :categorization_id, presence: true
end
