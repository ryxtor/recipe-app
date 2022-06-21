class Inventory < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  has_many :inventory_foods, foreign_key: :inventory_id, class_name: 'InventoryFood'

  validates :name, presence: true
end