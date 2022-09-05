FactoryBot.define do
  factory :workout do
    start_time { "2022-08-18 23:14:33" }
    part { "胸" }
    sleep { 5 }
    eat { 5 }
    motivation { 5 }
    fatigue { 5 }
    muscle { 5 }
    user
    workout_menus
  end
end
