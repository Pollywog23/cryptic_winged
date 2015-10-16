class AdminMailer < ApplicationMailer

 validates_presence_of :name
 validates_presence_of :body
 validates_presence_of :email

  default from: "crypticwingedserver@gmail.com"

  def contact_email(name, email, phone, body)
    @name = name
    @email = email
    @phone = phone
    @body = body
    mail(to:'crypticwingedphotography@yahoo.com')
  end
  
end
