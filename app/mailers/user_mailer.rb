class UserMailer < ApplicationMailer
  default from: 'giacomobrunetti6875@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://http://localhost:7000/login'
    mail(to: @user.email, subject: 'Welcome to MeetApp')
  end

end
