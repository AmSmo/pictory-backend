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
    has_many :location_photos, dependent: :destroy
    has_many :locations, through: :location_photos
    has_many :comments, dependent: :destroy
    has_many :commenters, through: :comments, source: :user
    has_many :user_photos, dependent: :destroy
    has_many :posters, through: :user_photos, source: :users
    has_one_attached :photograph

    def photoproof
        photo = Photo.find_by(id: self.id)
        if photo&.photograph&.attached?
            return "http://localhost:3000/#{rails_blob_url(photo.photograph, only_path: true)}"
        else
            return photo.url
        end
    end



end
