class Admin::BaseController < ApplicationController
  layout 'admin'

  before_filter :authorize
  
  def index
  end
  
  protected
  
  def authorize
    if current_user.nil?
      redirect_to login_url, alert: "Not authorized! Please log in."
    end
  end

  # def admin_required
  #   unless logged_in?
  #     flash[:error] = 'Wymagane są prawa administratora'
  #     redirect_to new_session_path
  #   end
  # end
end
