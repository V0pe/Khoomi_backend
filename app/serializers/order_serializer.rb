class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :address, :quantity, :item_id
end
