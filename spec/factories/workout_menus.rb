FactoryBot.define do
  factory :workout_menus do
    menu { "ベンチプレス" }
    first_set_weight { 100 }
    first_set_rep { 5 }
  end
end
