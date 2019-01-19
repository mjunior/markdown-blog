FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "meu#{n}@email.com.br" }
    password { '123123' }
    password_confirmation { '123123' }
  end
end
