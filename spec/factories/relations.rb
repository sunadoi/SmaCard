FactoryBot.define do
  
  factory :relation do
    name          {Faker::Name.name}
    location      {"hoge"}
    opening_time  {"10:00"}
    closing_time  {"22:00"}
    tel           {Faker::PhoneNumber.cell_phone}
    url           {"http"}
    image         { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/rspec_test.png')) }
    card_list
  end
  
end