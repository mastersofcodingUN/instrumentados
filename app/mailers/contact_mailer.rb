class ContactMailer < ApplicationMailer
  def contact_confirmation(contact)
    @contact = contact
    mail(to: contact.mail, subject: "Confirmación contacto Instrumentados")
  end
end
