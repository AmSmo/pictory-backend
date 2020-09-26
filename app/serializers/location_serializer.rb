class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :longitude, :latitude
end
