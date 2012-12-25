class TagBuilder

  def initialize(options={})
    @tag_list = options[:tag_list].split(',')
    @tags = []
  end

  def run
    @tag_list.each do |tag|
      @tag = (tag.match('new') ? new(tag) : find(tag))
      @tags << @tag
    end
    @tags
  end

  def find(tag_id)
    Tag.find tag_id
  end

  def new(tag_name)
    name = tag_name.gsub(/new-/, "")
    Tag.find_or_create_by_title :title => name
  end

end
