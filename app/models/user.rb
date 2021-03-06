class User < ActiveRecord::Base
  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: true
  validates :name, presence: true
  validates :first_name, presence: true
  validates :oauth_token, presence: true
  validates :oauth_expires_at, presence: true

  has_many :lists, dependent: :destroy
  has_many :likes, dependent: :destroy
  def self.from_omniauth(auth)
    find_or_initialize_by(provider: auth.provider, uid: auth.uid) do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.first_name = auth.info.first_name
      user.image = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def admin?
    self.role == "admin"
  end
end
