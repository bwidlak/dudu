# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include PerPageSupport
  include GetText

  helper :all
  protect_from_forgery

  filter_parameter_logging :password
  helper_method :logged_in?
  
  before_filter :load_footer_data
  
  protected
    
  def logged_in?
    session[:logged_in]
  end
  
  private
  
  def load_footer_data
    @categories = Category.all
    @comment = Comment.random.first || Comment.new
    @contact = Contact.new
  end
end
