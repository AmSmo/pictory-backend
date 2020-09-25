class Photo < ApplicationRecord
    has_many :location_photos, dependent: :destroy
    has_many :locations, through: :location_photos
    has_many :comments, dependent: :destroy
    has_many :commenters, through: :comments, source: :user
    has_many :user_photos, dependent: :destroy
    has_many :posters, through: :user_photos, source: :users


end
