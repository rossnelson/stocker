class PhotosController < ApplicationController

  respond_to :html, :json

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create

  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(params[:photo])
      format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: "edit" }
      format.json { render json: @photo.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to photos_url
  end
end
