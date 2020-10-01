class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :longitude, :latitude, :photo_order, :users
  has_many :photos

  def photo_order
    ordered_photos = self.object.photos.order(date: :desc)
    ordered_photos.map do |photo|
      {id: photo.id,
        name: photo.name,
      image_url: photo.image_url,
      date: photo.date
    }
    end
  end
end
