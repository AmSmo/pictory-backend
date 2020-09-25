class Location < ApplicationRecord
    has_many :location_photos, dependent: :destroy
    has_many :user_locations, dependent: :destroy
    has_many :photos, through: :location_photos
    has_many :users, through: :user_locations
end
