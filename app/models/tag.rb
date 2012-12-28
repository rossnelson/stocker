class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :photos, :through => :taggings

  def self.query_all(query='', create=true)
    tags = Tag.order('title')
    tags = tags.where('title LIKE ?', "%#{query}%") unless query.blank?

    tags_hash = tags.map{ |tag| {:id => tag.id, :name => tag.title} }
    unless create == "false"
      tags_hash.concat([{:id => "new-#{query}", :name => query}]) unless query_match(tags, query)
    end

    tags_hash
  end

  private

  def self.query_match(tags, query)
    tags.map!{|tag| tag.title}
    tags.include?(query)
  end
end
