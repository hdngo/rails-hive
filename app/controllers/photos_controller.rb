class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    @bumblebee = Bumblebee.find(params[:bumblebee_id])
    @photo = @bumblebee.photos.create(photo_params)
    redirect_to bumblebee_path(@bumblebee)
  end


  private
    def photo_params
      params.require(:photo).permit(:uploader, :url, :caption)
    end
end
