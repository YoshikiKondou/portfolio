FactoryBot.define do
  factory :diet do
    body_weight { 1.5 }
    protein { 1.5 }
    fat { 1.5 }
    carbohydrate { 1.5 }
    record_time { "2022-08-18 23:14:33" }
    user { nil }
  end
end
