Rails.configuration.stripe = {
  :publishable_key => "pk_test_yC9XiCgCnZ8EWcKiRsT1rnen",
  :secret_key      => "sk_test_yWAlXyyFc3noAkBSGfcbAJ2o"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]