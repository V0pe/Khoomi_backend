class Item < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :color, presence: true
  validates :price, presence: true
  validates :brand, presence: true
  validates :category, presence: true

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
