class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :lists, through: :categorizations

  validates :name, presence: true
end
