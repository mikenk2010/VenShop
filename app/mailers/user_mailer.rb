class UserMailer < ActionMailer::Base
  default from: "baonk@zigexn.vn"

  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email,
         :subject => "Welcome to My Awesome Site",
         :template_path => 'user_mailer',
         :template_name => 'welcome_email')
 end

 def checkout_email(product,user)
    @user = user
    @product = product
    @url  = "http://example.com/login"
    mail(:to => user.email,
         :subject => "Welcome to My Awesome Site",
         :template_path => 'user_mailer',
         :template_name => 'test')
  end
end