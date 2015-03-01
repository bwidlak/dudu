class Admin::CommentsController < Admin::BaseController
  before_filter :load_comment, :only => [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.paginate(:page => params[:page])
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(admin_comment_url(@comment))
    else
      render :action => "new"
    end
  end

  def update
    if @comment.update_attributes(params[:comment])
      flash[:notice] = 'Comment was successfully updated.'
      redirect_to(admin_comment_url(@comment))
    else
      render :action => "edit"
    end
  end

  def destroy
    @comment.destroy
    redirect_to(admin_comments_url)
  end

  private

  def load_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:author, :url, :body)
  end

end
