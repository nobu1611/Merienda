class Ingredient < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :cost_per_gram, presence: true, numericality: { greater_than: 0 }
end
