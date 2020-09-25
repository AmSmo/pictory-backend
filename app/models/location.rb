class Location < ApplicationRecord
    has_many :location_photos
    has_many :user_locations
    has_many :photos, through: :location_photos
    has_many :users, through: :user_locations
end
