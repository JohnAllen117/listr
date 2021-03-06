FactoryGirl.define do
  factory :user do
    sequence (:name) { |n| "Frank#{n} Tank" }
    sequence(:first_name) { |n| "Frank#{n}" }
    provider "facebook"
    sequence(:uid) { |n| "#{n}" }
    oauth_token 'abc123'
    oauth_expires_at DateTime.tomorrow

    trait :admin do
      role 'admin'
    end

    factory :admin, traits: [:admin]
  end
end
