class Photo < ActiveRecord::Base
  belongs_to :usage_right
  mount_uploader :filename, ImageUploader
  mount_uploader :unique_usage_right_filename, FileUploader

end
