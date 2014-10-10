class User < ActiveRecord::Base
validates :provider, presence: true
validates :uid, presence: true, uniqueness: true
validates :nickname, presence: true, uniqueness: true
validates :email, presence: true, uniqueness: true
validates :name, presence: true
validates :oauth_token, presence: true
validates :oauth_expires_at, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.nickname = auth.info.nickname
      user.email = auth.info.email
      user.image = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      binding.pry
      user.save!
    end
  end
end
