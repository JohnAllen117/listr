FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "frank#{n}@tank.com" }
    sequence (:name) { |n| "Frank#{n} Tank" }
    sequence(:first_name) { |n| "Frank#{n}" }
    provider "Facebook"
    sequence(:uid) { |n| n }
    oauth_token 'abc123'
    oauth_expires_at DateTime.tomorrow

    trait :admin do
      role 'admin'
    end

    factory :admin, traits: [:admin]
  end
end
