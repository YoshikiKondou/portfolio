class Workout < ApplicationRecord
  belongs_to :user
  validates :menu, { presence: true }
end
