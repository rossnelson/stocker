class PhotoUpdater

  def initialize(id=0, photo_attrs={})
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
      :source => @attrs[:source]
    }
  end

end
