require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase

  def contact_mail_preview

    AdminMailer.contact_email
  end
end
