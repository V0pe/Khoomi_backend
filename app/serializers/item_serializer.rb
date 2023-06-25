class ItemSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :color, :brand, :category, :price, :image_url
end
