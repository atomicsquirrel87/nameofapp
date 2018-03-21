class UserMailer < ApplicationMailer
  def contact_form(email, name, message)
    @email = email
    @message = message
    @name = name
    mail(from: email, to: 'dondomberlin@gmail.com', subject: "A new contact message from #{name}")
  end

  def welcome(user)
    @appname = "Dog Accessoires Berlin"
    mail(to: user.email,
         subject: "Welcome to #{@appname}!")
  end


end
