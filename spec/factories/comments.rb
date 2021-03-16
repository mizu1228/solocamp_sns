FactoryBot.define do
  factory :comment do
    comment      { 'test-comment' }
    association :user
    association :tweet
  end
end
