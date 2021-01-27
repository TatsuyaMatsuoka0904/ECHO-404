FactoryBot.define do
  factory :studio do
    name { 'test' }
    sequence(:email) { |n| "studio#{n}@example.com" }
    password { 'password' }
    address { '大阪市平野区' }
  end
end
