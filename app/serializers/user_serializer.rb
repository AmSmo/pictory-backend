class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :photos, :comments

  def photos
    self.object.photos.map do |photo|
      {id: photo.id,
      name: photo.name}
    end
  end

  def comments
    self.object.comments.map do |comment|
      {id: comment.id, 
      comment: comment.comment}
    end
  end
end
