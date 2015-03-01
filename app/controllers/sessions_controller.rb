class SessionsController < ApplicationController
  layout 'admin'

  def new
  end

  def create
    user = User.find_by_login(params[:login])
    if user && user.authenticate(params[:password], user)
      session[:user_id] = user.id
      puts "ZALOGOWANY"
      redirect_to admin_images_path, notice: 'Logged in!'
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end  

end
