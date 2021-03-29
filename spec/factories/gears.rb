FactoryBot.define do
  factory :gear do
    id              {     1      }
    gear_genre_id   {     1      }
    gear_name       { 'testname' }
    explanation     { 'testexp'  }

    association :user
    association :tweet

    after(:build) do |tweet|
      tweet.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end 
  end
end
