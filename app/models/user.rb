class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


  has_many :recipes, foreign_key: :user_id, class_name: 'Recipe', dependent: :delete_all
  has_many :inventories, foreign_key: :user_id, class_name: 'Inventory', dependent: :delete_all
end
