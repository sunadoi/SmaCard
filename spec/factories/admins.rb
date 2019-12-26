FactoryBot.define do
  
  factory :admin do
    name {"hoge"}
    email {Faker::Internet.free_email}
    password {"hogehoge"}
    password_confirmation {"hogehoge"}
  end
  
end