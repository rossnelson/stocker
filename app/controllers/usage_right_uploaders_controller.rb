class UsageRightUploadersController < ApplicationController

  respond_to :json

  def create
    file = AppSpecificStringIO.new(params[:qqfile], request.raw_post)

    @photo = Photo.find(params[:photo_id])
    @photo.update_attributes :unique_usage_right_filename => file

    render :json => {:success => true, :filename => @photo.unique_usage_right_filename_identifier}
  end

end
