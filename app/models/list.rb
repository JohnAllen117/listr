class List < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, through: :categorizations
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
end
