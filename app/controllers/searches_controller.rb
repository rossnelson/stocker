class SearchesController < ApplicationController

  def photos_from_tags
    @search = Search.new(params[:tags])
    render :json => @search.find_photos.map{|p| p.to_builder }
  end

end
