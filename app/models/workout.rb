class Workout < ApplicationRecord
  belongs_to :user
  validates :menu, { presence: true }
  validates :weight, { presence: true, numericality: true, length: { maximum: 3 } }
  validates :rep, { presence: true, numericality: true, length: { maximum: 3 } }
  validates :set, { presence: true }
  validates :sleep, { presence: true }
  validates :eat, { presence: true }
  validates :motivation, { presence: true }
  validates :fatigue, { presence: true }
  validates :mental, { presence: true }

  def self.volume(weight, rep)
    weight * rep
  end
end
