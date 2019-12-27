FactoryBot.define do
  
  factory :card_list do
    admin

    after(:create) do |card_list|
      create(:benefit_list, card_list: card_list)
    end
  end
  
end