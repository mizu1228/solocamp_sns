FactoryBot.define do
  factory :user do
    name                    { 'tesr' }
    email                   {Faker::Internet.free_email}
    password                { '1234abcd' }
    password_confirmation   { password }
    phone_num               { '09012345678' }

  end
end