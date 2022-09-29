FactoryBot.define do
  factory :diet do
    record_time { "2022-08-18 23:14:33" }
    body_weight { 80 }
    protein { 50 }
    fat { 50 }
    carbohydrate { 50 }
    user
  end

  factory :other_diet, class: Diet do
    record_time { "2022-08-11 23:14:33" }
    body_weight { 81 }
    protein { 60 }
    fat { 60 }
    carbohydrate { 60 }
    user
  end
end
