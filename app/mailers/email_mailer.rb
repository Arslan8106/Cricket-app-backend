class EmailMailer < ApplicationMailer
  def send_email(recipient, subject, body)
    @body = body
    mail(to: recipient, subject: subject) do |format|
      format.text { render plain: @body }
    end
  end
end
