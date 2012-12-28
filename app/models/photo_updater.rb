class PhotoUpdater
  include Kozak::Application.routes.url_helpers

  def initialize(user, id=0, photo_attrs={})
    @user = user
    @photo = Photo.find id
    @attrs = photo_attrs
  end

  def update
    Photo.transaction do
      @photo.update_attributes sanitized_attr
    end
    { :sucess => true }
  end

  def sanitized_attr
    {
      :title => @attrs[:title],
      :source => @attrs[:source],
      :tags => build_tags, #@attrs[:tag_list]
      :user => @user
    }
  end

  def build_tags
    tags = TagBuilder.new(:tag_list => @attrs[:tag_list])
    tags.run
  end

  def url
    photo_path @photo.id
  end


end
