FactoryGirl.define do
  factory :list do
    association :user

    title "A list"
    content "This is content"
  end
end
