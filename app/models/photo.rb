class Photo < ApplicationRecord
    has_many :location_photos
    has_many :locations, through: :location_photos
    has_many :comments
    has_many :commenters, through: :comments, source: :user
    has_many :user_photos
    has_many :posters, through: :user_photos, source: :users

        # has_many :commented_on, through: :comments, source: :photo

end
