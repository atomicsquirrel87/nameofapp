class SimplePagesController < ApplicationController
  def index
  end

  def landing_page
    @products = Product.limit(3)
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(from: @email, to: 'dondomberlin@gmail.com', subject: "A new contact message from #{@email}", body: "#{@name} sent following message: " + "\n" + @message).deliver_now
  end


end
