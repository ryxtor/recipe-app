class InventoryFood < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :food

  validates :food_id, presence: true
  validates :inventory_id, presence: true
  validates :quantity, presence: true
end
