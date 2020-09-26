# == Schema Information
#
# Table name: user_photos
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  photo_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserPhoto < ApplicationRecord
  belongs_to :user
  belongs_to :photo
end
