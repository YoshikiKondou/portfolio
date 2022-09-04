FactoryBot.define do
  factory :diet do
    record_time { "2022-08-18 23:14:33" }
    body_weight { 80 }
    protein { 50 }
    fat { 50 }
    carbohydrate { 50 }
    user
  end
end
