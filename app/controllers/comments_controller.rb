class CommentsController < ApplicationController
  
  def index
    @comments = Comment.paginate(page: params[:page])
  end

end
