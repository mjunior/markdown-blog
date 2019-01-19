FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Title #{n}" }
    body { "This is *bongos*, indeed." }
  end
end