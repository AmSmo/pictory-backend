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
            metadata = photo.photograph.blob.metadata
            debugger
            if metadata["longitude"] && metadata["latitude"]
               
                render json: info
            else
                render json: photo, status: :created
            end

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
      photo: {
        id: photo.id,
        story: "lovely lady"
      }
    }
  end

  def error_json(user)
    { errors: user.errors.full_messages }
  end
end
