class Order < ApplicationRecord
  belongs_to :item, class_name: 'item', foreign_key: 'item_id'

  validates :name, presence: true
  validates :address, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
end
