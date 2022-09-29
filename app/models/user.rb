class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :workout
  has_many :diet
  has_secure_password
  validates :name, presence: true
  validates :age, numericality: { greater_than: 1, less_than: 110 }, allow_blank: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password_digest, presence: true, length: { minimum: 6 }, on: :create
  validates :target_protein, numericality: { greater_than: 0, less_than: 1000 }, allow_blank: true
  validates :target_fat, numericality: { greater_than: 0, less_than: 1000 }, allow_blank: true
  validates :target_carbohydrate, numericality: { greater_than: 0, less_than: 1000 }, allow_blank: true
end
