class Recipe < ApplicationRecord
  has_many :recipe_foods, foreign_key: 'recipe_id'
  belongs_to :user, class_name: 'User'

  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :user_id, presence: true

  def food_ids
    recipe_foods.map(&:food_id)
  end

  def short_text
    description.truncate(100)
  end
end
