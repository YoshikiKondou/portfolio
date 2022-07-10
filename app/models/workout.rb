class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_menu
  accepts_nested_attributes_for :workout_menu, allow_destroy: true
  validates_associated :workout_menu
  validates :sleep, { presence: true }
  validates :eat, { presence: true }
  validates :motivation, { presence: true }
  validates :fatigue, { presence: true }
  validates :mental, { presence: true }
end
