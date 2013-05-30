class UserMailer < ActionMailer::Base
  default from: "baonk@zigexn.vn"

  def welcome_email(user)
   @user = user
   @url  = "http://example.com/login"
   mail(:to => "baonk@zigexn.vn", :subject => "Welcome to My Awesome Site")
 end
end
