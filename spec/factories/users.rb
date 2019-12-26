FactoryBot.define do
  
  factory :user do
    name {"hoge"}
    email {Faker::Team.email}
    password {"hogehoge"}
    password_confirmation {"hogehoge"}
    tel {Faker::PhoneNumber.cell_phone}
  end
  
end