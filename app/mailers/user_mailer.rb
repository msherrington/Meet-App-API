class UserMailer < ApplicationMailer
  default from: 'meet.app.mail@gmail.com'

  APP_URL = ENV["APP_URL"] || "http://localhost:7000"

  def welcome_email(user)
    @user = user
    @url  = "#{APP_URL}/login"
    mail(to: @user.email, subject: 'Welcome to MeetApp')
  end

  def ticket_email(user, ticket, event)
    @user = user
    @ticket = ticket
    @ticket_id = ticket.id
    @event = event
    @id = user.id
    @url  = "#{APP_URL}/events"
    mail(to: @user.email, subject: 'Your ticket!')
  end

end
