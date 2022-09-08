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
    workout_menus {[
      FactoryBot.build(:workout_menu, workout: nil)
    ]}
  end

  factory :other_workout, class: Workout do
    start_time { "2022-08-11 23:14:33" }
    part { "胸" }
    sleep { 1 }
    eat { 1 }
    motivation { 1 }
    fatigue { 1 }
    muscle { 1 }
    user
    workout_menus {[
      FactoryBot.build(:workout_menu, workout: nil)
    ]}
  end
end
