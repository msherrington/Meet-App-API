class UserMailer < ApplicationMailer
  default from: 'meet.app.mail@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:7000/login'
    mail(to: @user.email, subject: 'Welcome to MeetApp')
  end

  def ticket_email(user, ticket, event)
    @user = user
    @ticket = ticket
    @ticket_id = ticket.id
    @event = event
    @id = user.id
    @url  = 'http://localhost:7000/events'
    mail(to: @user.email, subject: 'Your ticket!')
  end

end
