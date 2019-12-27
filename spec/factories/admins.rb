FactoryBot.define do

  pass = Faker::Internet.password(8)

  factory :admin do
    name                  {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {pass}
    password_confirmation {pass}

    after(:create) do |admin|
      create(:card_list, admin: admin)
    end
  end
  
end