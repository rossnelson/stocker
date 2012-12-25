module Taggert
  extend ActiveSupport::Concern

  module ClassMethods
    def tagged_with(name)
      Tag.find_by_title!(name).photos
    end

    def tag_counts
      Tag.select("tags.*, count(taggings.tag_id) as count").
        joins(:taggings).group("taggings.tag_id")
    end
  end

  def tag_list
    self.tags.map{ |tag| {:id => tag.id, :name => tag.title} }
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(title: n.strip).first_or_create!
    end
  end

  def similar
    similar = tags.map{|tag| tag.photos }.flatten.uniq
    similar.delete_if{ |photo| photo == self }
  end
end
