class Recipe < ApplicationRecord
  has_many :recipe_foods, foreign_key: 'recipe_id'
  belongs_to :user, class_name: 'User'

  validates :name, presence: true

  def food_ids
    recipe_foods.map(&:food_id)
  end
end
