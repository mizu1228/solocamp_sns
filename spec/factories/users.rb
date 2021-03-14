FactoryBot.define do
  factory :user do
    id                      { 1 }
    name                    { 'test' }
    email                   {Faker::Internet.free_email}
    password                { '1234abcd' }
    password_confirmation   { password }
    phone_num               { '09012345678' }

  end
end