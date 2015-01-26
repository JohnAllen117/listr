FactoryGirl.define do
  factory :list do
    association :user

    title "A list"
    content "This is content"

    trait :private do
      private 'true'
    end

    factory :private_list, traits: [:private]
  end
end
