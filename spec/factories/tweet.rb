FactoryBot.define do
  factory :tweet do
    text           { 'test-tweet' }
    id             { 1 }
    
    after(:build) do |tweet|
      tweet.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end 
  end
end
