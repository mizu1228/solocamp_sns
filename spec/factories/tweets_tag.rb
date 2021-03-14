FactoryBot.define do
  factory :tweets_tag do
    text           { 'test-tweet' }
    tag_name       { 'test-tag' }
    
    after(:build) do |tweet|
      tweet.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end 
  end
end
