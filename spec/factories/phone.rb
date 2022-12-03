FactoryBot.define do
  factory :phone do
    country_code { FFaker::PhoneNumberBR.country_code }
    number { FFaker::PhoneNumber.phone_number }
  end
end
