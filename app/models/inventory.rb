class Inventory < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  has_many :inventory_foods, foreign_key: :inventory_id, class_name: 'InventoryFood'

  validates :name, presence: true
  validates :description, presence: true

  def food_ids
    inventory_foods.map(&:food_id)
  end
end
