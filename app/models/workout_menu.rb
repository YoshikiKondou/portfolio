class WorkoutMenu < ApplicationRecord
  belongs_to :workout
  validates :menu, presence: true
  validates :first_set_weight, presence: true, numericality: { greater_than: 0, less_than: 1000 }
  validates :second_set_weight, numericality: { greater_than: 0, less_than: 1000 }, allow_blank: true
  validates :third_set_weight, numericality: { greater_than: 0, less_than: 1000 }, allow_blank: true
  validates :fourth_set_weight, numericality: { greater_than: 0, less_than: 1000 }, allow_blank: true
  validates :fifth_set_weight, numericality: { greater_than: 0, less_than: 1000 }, allow_blank: true
  validates :first_set_rep, presence: true, numericality: { greater_than: 0, less_than: 100 }
  validates :second_set_rep, numericality: { greater_than: 0, less_than: 100 }, allow_blank: true
  validates :third_set_rep, numericality: { greater_than: 0, less_than: 100 }, allow_blank: true
  validates :fourth_set_rep, numericality: { greater_than: 0, less_than: 100 }, allow_blank: true
  validates :fifth_set_rep, numericality: { greater_than: 0, less_than: 100 }, allow_blank: true
end
