class WorkoutMenu < ApplicationRecord
  belongs_to :workout
  validates :menu, presence: true
  validates :first_set_weight, presence: true, numericality: { greater_than: 1,less_than: 700 }
  validates :second_set_weight, numericality: { greater_than: 1,less_than: 700 }, allow_blank: true
  validates :third_set_weight, numericality: { greater_than: 1,less_than: 700 }, allow_blank: true
  validates :fourth_set_weight, numericality: { greater_than: 1,less_than: 700 }, allow_blank: true
  validates :fifth_set_weight, numericality: { greater_than: 1,less_than: 700 }, allow_blank: true
  validates :first_set_rep, presence: true, numericality: true, length: { maximum: 2 }
  validates :second_set_rep, numericality: true, length: { maximum: 2 }, allow_blank: true
  validates :third_set_rep, numericality: true, length: { maximum: 2 }, allow_blank: true
  validates :fourth_set_rep, numericality: true, length: { maximum: 2 }, allow_blank: true
  validates :fifth_set_rep, numericality: true, length: { maximum: 2 }, allow_blank: true
end
