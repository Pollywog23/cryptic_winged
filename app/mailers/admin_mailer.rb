class AdminMailer < ApplicationMailer

  default from: "crypticwingedserver@gmail.com"

  def contact_email(name, email, phone, body)
    @name = name
    @email = email
    @phone = phone
    @body = body
    mail(to:'crypticwingedphotography@yahoo.com')
  end

end
