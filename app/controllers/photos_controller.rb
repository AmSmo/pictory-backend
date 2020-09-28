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

    def update
      
      photo = Photo.find_by(id: params[:id])
      photo.update(update_params)
      locations = Location.search(params[:longitude].to_f, params[:latitude].to_f)
      
      if locations.length > 0
        response = { places: ActiveModelSerializers::SerializableResource.new(locations),
            photo: ActiveModelSerializers::SerializableResource.new(photo)}
        render json: response 
      else
        render json: {found: "none", photo: ActiveModelSerializers::SerializableResource.new(photo)}
      end

    end

    def create
        
        photo = Photo.create(create_params)
        if photo.valid?
            metadata = photo.photograph.blob.metadata
            
            if metadata["longitude"] && metadata["latitude"]
               
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

  def update_params
    params.require(:photo).permit(:name, :date, :caption)
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
