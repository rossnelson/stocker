class Photo < ActiveRecord::Base
  include Kozak::Application.routes.url_helpers
  include Taggert

  attr_accessible :filename, :title, :tags, :unique_usage_right_filename, 
    :source, :unique_usage_right, :shared_usage_right_id, :comments, :tag_list,
    :user, :user_id

  belongs_to :shared_usage_right
  belongs_to :user
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
    json.photo_url photo_path(self)

    json.attributes!
  end

  def cleanup_tags
    tags.each do |tag|
      tag.destroy if tag.photos.count == 1 
    end
  end

end
