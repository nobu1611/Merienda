class User < ApplicationRecord
  has_many :ingredients
  has_many :recipes

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
