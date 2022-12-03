FactoryBot.define do
  factory :citizen do
    email { FFaker::Internet.unique.email }
    name { FFaker::Name.name }
    cpf { FFaker::IdentificationBR.cpf }
    cns { '701181217110005' }

    association :address
    association :phone
  end
end
