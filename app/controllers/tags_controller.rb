class TagsController < ApplicationController
  def index
    @tags = Tag.query_all(params[:q])
    render :json => @tags
  end
end
