FactoryBot.define do
  factory :user do
    email { 'meu@email.com.br' }
    password { '123123' }
    password_confirmation { '123123' }
  end
end
