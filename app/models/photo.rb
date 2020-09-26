# == Schema Information
#
# Table name: photos
#
#  id         :bigint           not null, primary key
#  name       :string
#  date       :datetime
#  caption    :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Photo < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_one :location_photo, dependent: :destroy
    has_one :locations, through: :location_photo
    has_many :comments, dependent: :destroy
    has_many :commenters, through: :comments, source: :user
    has_many :user_photos, dependent: :destroy
    has_many :posters, through: :user_photos, source: :users
    has_one_attached :photograph

    def photoproof
        photo = Photo.find_by(id: self.id)
        if photo&.photograph&.attached?
            return "http://localhost:3000#{rails_blob_url(photo.photograph, only_path: true)}"
        else
            return false
        end
    end

    def image_url
        if photoproof
            return photoproof
        else
            return self.url
        end
    end

    def longitude
        if self&.photograph&.attached?
            if self.photograph.blob.metadata["longitude"] != nil
                return self.photograph.blob.metadata["longitude"].round(4)
            end
        end
    end

    def latitude
        if self&.photograph&.attached?
            if self.photograph.blob.metadata["longitude"] != nil
                return self.photograph.blob.metadata["latitude"].round(4)
            end
        end
    end
end
