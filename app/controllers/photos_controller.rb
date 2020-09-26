class PhotosController < ApplicationController
    after_action :location_creation, only: [:create] 

    def index
        photos = Photo.all
        render json: photos
    end

    def show

        photo = Photo.find_by(id: params[:id])
        render json: photo
    end

    def create
        
        photo = Photo.create(create_params)
        if photo.valid?
            metadata = photo.photograph.blob.metadata
            
            if metadata["longitude"] && metadata["latitude"]
               info = {user: "bullocks"}
                render json: photo, status: :created
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

  def location_creation
    
  end
end
