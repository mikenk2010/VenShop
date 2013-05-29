class UserMailer < ActionMailer::Base
  default from: "baonk@zigexn.vn"

  def welcome_email(user)
    @user = "baonguyenkhac"
    @url  = "http://example.com/login"
    mail(:to => "baonk@zigexn.vn",
         :subject => "Welcome to My Awesome Site",
         :template_path => 'user_mailer',
         :template_name => ' welcome_email.html.erb')
  end
end
