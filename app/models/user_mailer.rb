class UserMailer < ActionMailer::Base
  def marcin_contact contact
    recipients Settings.email.owner
    from contact.name
    subject "Wiadomosc dla marcina od #{contact.name}"
    sent_on Time.now
    body :contact => contact
  end
end
