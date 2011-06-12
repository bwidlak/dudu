class CommentsController < ApplicationController
  per_page 10
  
  def index
    @comments = Comment.paginate(paginate_options)
  end

end
