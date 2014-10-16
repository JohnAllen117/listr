class List < ActiveRecord::Base
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  has_many :likes, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true

  def liked_list(current_user)
    self.likes.each do |like|
      if like.user == current_user
        return like
      end
    end
    nil
  end
end
