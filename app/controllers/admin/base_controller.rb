class Admin::BaseController < ApplicationController
  layout 'admin'

  before_filter :admin_required
  
  def index
  end
  
  protected
  
  def admin_required
    unless logged_in?
      flash[:error] = _('Wymagane są prawa administratora')
      redirect_to new_session_path
    end
  end
end
