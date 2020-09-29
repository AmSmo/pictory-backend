class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :comment,
end
