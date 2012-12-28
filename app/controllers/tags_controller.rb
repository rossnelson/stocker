class TagsController < ApplicationController
  def index
    @tags = Tag.query_all(params[:q], params[:create])
    render :json => @tags
  end
end
