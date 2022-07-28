class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :workout
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 6 }, on: :create
end
