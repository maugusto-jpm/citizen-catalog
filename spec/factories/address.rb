FactoryBot.define do
  factory :address do
    street { 'FFaker::Address.street_name' }
    zip_code { 'FFaker::AddressUS.zip_code' }
    neighborhood { 'FFaker::Address.neighborhood' }
    uf { 'FFaker::AddressUS.state_abbr' }
    complement { 'FFaker::AddressBR.complement' }
  end
end
