class VendorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :address, :country
end
