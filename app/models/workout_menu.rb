class WorkoutMenu < ApplicationRecord
  belongs_to :workout
  validates :menu, { presence: true }
  validates :first_set_weight, { presence: true, numericality: true, length: { maximum: 3 } }
  validates :first_set_rep, { presence: true, numericality: true, length: { maximum: 2 } }
end
