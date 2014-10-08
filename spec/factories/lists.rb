FactoryGirl.define do
  factory :list do
    sequence(:title) { |n| "frank#{n}@tank.com" }
    sequence(:content) { |n| "frank#{n}" }
  end
end
