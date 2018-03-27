if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_ssD8XbulqGLb7t7V0Nt1hjpM',
    secret_key: 'sk_test_T9EWSOOUQ31etVaLwDif4qzv'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
