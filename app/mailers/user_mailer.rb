class UserMailer < ApplicationMailer
  default from: 'meet.app.mail@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://http://localhost:7000/login'
    mail(to: @user.email, subject: 'Welcome to MeetApp')
  end

  def ticket_email(user)
    @user = user
    @id = user.id
    @url  = `http://http://localhost:7000/users/#{@id}`
    mail(to: @user.email, subject: 'Your ticket')
  end

end
