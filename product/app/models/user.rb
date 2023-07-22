class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  has_many :recipes
  has_many :ingredients
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
