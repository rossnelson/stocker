class PhotosController < ApplicationController

  before_filter :require_login

  respond_to :html, :json

  def index
    @tags = Tag.all
    @photos = Photo.all.map{|p| p.to_builder }
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
    @photo = PhotoUpdater.new(current_user, params[:id], params[:photo])

    if @photo.update
      redirect_to @photo.url, notice: 'Photo was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.cleanup_tags
    @photo.destroy

    redirect_to photos_url
  end
end
