FactoryBot.define do
  factory :event do
    name { 'test' }
    performer { 'password' }
    place { '大阪市平野区' }
    content { 'testtest' }
    start_at { '2020-01-01 18:30:00' }
    end_at { '2020-01-09 18:30:00' }
  end
end
