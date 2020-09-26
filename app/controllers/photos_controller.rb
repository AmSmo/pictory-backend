class PhotosController < ApplicationController
    def index
        photos = Photo.all
        render json: photos
    end

    def show

        photo = Photo.find_by(id: params[:id])
        render json: photo
    end

    def create
        
        photo = Photo.new(create_params)
        if photo.save
            render json: {"woo": "hoo"}
        else
            render json: {"boo": "hoo"}
        end
  end

  private

  def create_params
    params.permit(:user, :name, :caption, :url, :photograph)
  end

  def success_json(user)
    {
      user: {
        id: user.id,
        username: user.username
      }
    }
  end

  def error_json(user)
    { errors: user.errors.full_messages }
  end
end
