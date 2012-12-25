class Photo < ActiveRecord::Base
  include Taggert

  attr_accessible :filename, :title, :tags, :unique_usage_right_filename, 
    :source, :unique_usage_right, :shared_usage_right_id, :comments, :tag_list

  belongs_to :shared_usage_right
  has_many :taggings
  has_many :tags, :through => :taggings

  mount_uploader :filename, ImageUploader
  mount_uploader :unique_usage_right_filename, FileUploader

  def success
    true
  end

  def url
    filename.url
  end

  def to_builder
    json = Jbuilder.new

    json.(self, :id, :success, :url, :filename_identifier)
    json.image 

    json
  end

end
