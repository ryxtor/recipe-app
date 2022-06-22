class Food < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods
  has_many :recipe_foods
end
