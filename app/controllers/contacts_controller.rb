class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new contact_params
    if @contact.valid?
      # UserMailer.marcin_contact(@contact).deliver_now
      flash[:notice] = "OK"
      redirect_to new_contact_path
    else
      render action: :edit
    end
  end

  def edit
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone, :body)
  end

end
