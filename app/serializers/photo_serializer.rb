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
class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :caption, :image_url
end
