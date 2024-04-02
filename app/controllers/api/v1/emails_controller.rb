# app/controllers/emails_controller.rb

class Api::V1::EmailsController < ApplicationController
  def send_email
    recipients = User.pluck(:email)
    subject = params[:subject]
    body = params[:message]

    if recipients.blank? || subject.blank? || body.blank?
      render json: { error: 'Missing parameters' }, status: :unprocessable_entity
      return
    end

    begin
      mails = recipients.map do |recipient|
        EmailMailer.send_email(recipient, subject, body)
      end
      mails.each(&:deliver_later)
      render json: { message: 'Email sent successfully' }, status: :ok
    rescue Net::SMTPAuthenticationError => e
      render json: { error: 'SMTP authentication error' }, status: :internal_server_error
    rescue Net::SMTPServerBusy => e
      render json: { error: 'SMTP server busy' }, status: :internal_server_error
    rescue StandardError => e
      render json: { error: 'Error sending email' }, status: :internal_server_error
    end
  end

end
