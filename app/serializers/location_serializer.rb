class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :longitude, :latitude
  has_many :photos
end
