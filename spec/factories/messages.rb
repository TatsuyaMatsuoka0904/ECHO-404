FactoryBot.define do
  factory :message do
    sequence(:room_id) { |n| n }
    sequence(:content) { |c| c }
  end
end
