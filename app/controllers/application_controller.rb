class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  
  before_filter :load_footer_data
      
  private
  
  def load_footer_data
    @categories = Category.all
    @comment = Comment.random.first || Comment.new
    @contact = Contact.new
  end

  def current_user
    User.find(session[:user_id])
  end

  helper_method :current_user

end
