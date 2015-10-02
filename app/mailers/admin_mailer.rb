class AdminMailer < ApplicationMailer

  default from: "marshasclark23@gmail.com"

  def contact_email(name, email, phone, body)
    @name = name
    @email = email
    @phone = phone
    @body = body
    mail(to:'marshasclark23@gmail.com')
    #mail(to:'crypticwingedphotography@yahoo.com
  end
  
end
