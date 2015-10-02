class ContactController < ApplicationController

  def send_mail
    name = params[:name]
    email = params[:email]
    phone = params[:phone]
    body = params[:message]

    AdminMailer.contact_email(name, email, phone, body).deliver_now!
    #redirect_to contact_path, notice: 'Message sent'
  end

end