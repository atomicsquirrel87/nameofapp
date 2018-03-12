# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


config.action_mailer.default_url_options = { :host => 'dog-accessoires-berlin.herokuapp.com' }
config.action_mailer.delivery_method = :smtp
config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = false
config.action_mailer.default :charset => "utf-8" 
# SMTP settings for gmail
config.action_mailer.smtp_settings = {
 :address              => "smtp.gmail.com",
 :port                 => 587,
 :user_name            => ENV['gmail_username'],
 :password             => ENV['gmail_password'],
 :authentication       => "plain",
 :domain               => "dog-accessoires-berlin.herokuapp.com",
 :enable_starttls_auto => true
}
