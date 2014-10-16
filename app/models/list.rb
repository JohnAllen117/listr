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

  def self.search(search)
    where('title ILIKE ?', "%#{search}%")
  end

  def self.populate_index_with(query)
    if query[:search]
      @lists = List.search(query[:search])
    else
      @lists = List.all
    end
  end
end
