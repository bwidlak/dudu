class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new params[:contact]
    render :update do |page|
      if @contact.valid?
        UserMailer.deliver_marcin_contact @contact
        page.replace_html 'contact_form', _('Wiadomość została wysłana!')
      else
        page.replace_html 'contact_form', :partial => 'shared/contact_form'
      end
    end
  end
end
