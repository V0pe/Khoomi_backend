class Item < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :color, presence: true
  validates :price, presence: true
  validates :brand, presence: true
  validates :category, presence: true
end
