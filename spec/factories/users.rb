FactoryBot.define do
    factory :user do
      password = Faker::Internet.password(min_length: 7)
      name {Faker::Name.last_name}
      email {Faker::Internet.free_email}
      password {password}
      password_confirmation {password}
      birth_date {"1989-01-01"}
    end
  end