class Photo < ActiveRecord::Base
  attr_accessible :filename, :title, :tags, :unique_usage_right_filename, :source
  belongs_to :shared_usage_right
  mount_uploader :filename, ImageUploader
  mount_uploader :unique_usage_right_filename, FileUploader

  def success
    true
  end

  def url
    filename.url
  end

  def to_builder
    asset = Jbuilder.new

    asset.(self, :id, :success, :url, :filename_identifier)
    asset.image 

    asset
  end

end
