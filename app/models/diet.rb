class Diet < ApplicationRecord
  belongs_to :user
  validates :record_time, presence: true
  validates :body_weight, numericality: { greater_than: 0, less_than: 120 }
  validates :protein, numericality: { greater_than: 0, less_than: 1000 }
  validates :fat, numericality: { greater_than: 0, less_than: 1000 }
  validates :carbohydrate, numericality: { greater_than: 0, less_than: 1000 }
end
