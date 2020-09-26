class ActiveStorageAttachment < ApplicationRecord
  belongs_to :blob, foreign_key: :blob_id, class_name: "ActiveStorageBlob"
  belongs_to :photo, foreign_key: :record_id

  def has_data
    if blob.longitude && blob.latitude
        location = Location.find__by(longitude: blob.longitude, latitude: blob.latitude)
        if location
            LocationPhoto.create(location: location, photo: self.photo)
        else
            location = Location.create(longitude: blob.longitude, latitude: blob.latitude, name: "#{blob.longitude}, #{blob.latitude}")
            LocationPhoto.create(location: location, photo: self.photo)
        end
    end
  end
  
end
