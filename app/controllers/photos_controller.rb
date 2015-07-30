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

  def edit
    @bumblebee = Bumblebee.find(params[:bumblebee_id])
    @photo = Photo.find(params[:id])
  end

  def update
    @bumblebee = Bumblebee.find(params[:bumblebee_id])
    @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      redirect_to bumblebee_photo_path(@bumblebee, @photo)
    else
      render 'edit'
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:uploader, :url, :caption)
    end
end
