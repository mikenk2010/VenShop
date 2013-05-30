class UserMailer < ActionMailer::Base
  default from: "baonk@zigexn.vn"

  def welcome_email(user)
   @user = user
   @url  = "http://VenShop.com/login"
   mail(:to => user.email,
    :subject => "Welcome to My Awesome Site",
    :body => 'Welcome to VenShop.com
===============================================

To login to the site, just follow this link: VenShop.com.

Thanks for joining and have a great day!
  '

    )
 end
end
