# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :commented_on, through: :comments, source: :photo
    has_many :user_photos, dependent: :destroy
    has_many :photos, through: :user_photos
    has_many :user_locations, dependent: :destroy
    has_many :locations, through: :user_locations

end
