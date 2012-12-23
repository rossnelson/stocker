class PhotoUploadersController < ApplicationController

  respond_to :json

  def show
    @photo = Photo.find params[:id]
  end

  def create
    file = AppSpecificStringIO.new(params[:qqfile], request.raw_post)
    @photo = Photo.create :filename => file
    redirect_to photo_uploader_path(@photo.id)
  end

  def update
    @photo = PhotoUpdater.new(params[:id], params[:photo_uploader])
    respond_with @photo.update
  end

  def destroy
    respond_with Photo.destroy(params[:id]) 
  end
end
