if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_gvrFANMOVs57j14ahLfsyZZb',
    secret_key: 'sk_test_2jkOvs5VfwdsNtIJSlLoZG9b'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]