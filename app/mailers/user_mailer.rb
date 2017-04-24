class UserMailer < ApplicationMailer
  default from: 'meet.app.mail@gmail.com'

  @app_url = ENV["APP_URL"] || "http://localhost:7000"

  def welcome_email(user)
    @user = user
    @url  = "#{@app_url}/login"
    mail(to: @user.email, subject: 'Welcome to MeetApp')
  end

  def ticket_email(user, ticket, event)
    @user = user
    @ticket = ticket
    @ticket_id = ticket.id
    @event = event
    @id = user.id
    @url  = "#{@app_url}/events"
    mail(to: @user.email, subject: 'Your ticket!')
  end

end
