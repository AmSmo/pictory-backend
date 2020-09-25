class User < ApplicationRecord
    has_many :comments
    has_many :commented_on, through: :comments, source: :photo
    has_many :user_photos
    has_many :photos, through: :user_photos
    has_many :user_locations
    has_many :locations, through: :user_locations

end
