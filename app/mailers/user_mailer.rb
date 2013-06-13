class UserMailer < ActionMailer::Base
  default from: "c.feliciano2009@gmail.com"

   def welcome_email(user)
    @user = user
    @url  = "https://receptionist-techsummit.herokuapp.com/"
    mail(:to => user.email, :subject => "Welcome to the Receptionist App")
  end
end
