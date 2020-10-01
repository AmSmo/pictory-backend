# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  name       :string
#  longitude  :float
#  latitude   :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Location < ApplicationRecord
    has_many :location_photos, dependent: :destroy
    has_many :user_locations, dependent: :destroy
    has_many :photos, through: :location_photos
    has_many :users, through: :user_locations

    def self.search(longitude,latitude)
        Location.where('latitude >= ? AND latitude <= ? AND longitude >= ? AND longitude <= ?', 
            (latitude - 0.0015), 
            (latitude + 0.0015),
            (longitude - 0.0015), 
            (longitude + 0.0015),
        ).limit(12)
    end

    def self.grander_search(longitude,latitude)
        Location.where('latitude >= ? AND latitude <= ? AND longitude >= ? AND longitude <= ?', 
            (latitude - 0.002), 
            (latitude + 0.002),
            (longitude - 0.002), 
            (longitude + 0.002),
        ).limit(8)
    end
end
