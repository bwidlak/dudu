class SessionsController < ApplicationController
  layout 'admin'
  
  def new
  end
  
  def create
    if params[:login] == Settings.admin.login && params[:password] == Settings.admin.password
      session[:logged_in] = true
      flash[:notice] = _('Logowanie powiodło sie')
      redirect_to admin_path
    else
      flash[:error] = _('Zły login lub hasło')
      redirect_to new_session_path
    end
  end
  
  def destroy
    session[:logged_in] = nil
    flash[:notice] = _('Zostałeś wylogowany')
    redirect_to root_path
  end
end
