class WorkoutMenu < ApplicationRecord
  belongs_to :workout
  validates :menu, { presence: true }
  validates :weight, { presence: true, numericality: true, length: { maximum: 3 } }
  validates :rep, { presence: true, numericality: true, length: { maximum: 2 } }
  validates :set, { presence: true, numericality: true, length: { maximum: 2 } }
end
