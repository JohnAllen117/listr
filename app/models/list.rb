class List < ActiveRecord::Base
  has_many :categories, through: :categorizations
  validates :title, presence: true
  validates :content, presence: true
end
