class Search

  attr_accessor :tags

  def initialize(titles={})
    #tag_ids = tags.map{|t| t[:id] }
    @titles = titles
    @tags = find_tags# Tag.find tag_ids
    @photos = @tags.map{|tag| tag.photos }.flatten.uniq
  end

  def find_tags
    @titles.map! do |tag|
      Tag.find_by_title tag['title']
    end
  end

  def find_photos
    return Photo.all if @tags.blank?

    @photos.delete_if do |p|
      intersection = (@tags & p.tags)
      intersection.length < @tags.length
    end
    @photos
  end

end
